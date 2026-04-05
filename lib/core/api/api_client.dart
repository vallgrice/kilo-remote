import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/message.dart';
import '../models/part.dart';
import '../models/session.dart';
import 'api_constants.dart';

/// Cookie jar that syncs WebView cookies into Dio requests.
class WebViewCookieJar extends DefaultCookieJar {
  /// Call this after WebView login to copy cookies into the jar.
  Future<void> setCookiesFromString(String cookieString, Uri uri) async {
    if (cookieString.isEmpty) return;
    final cookies = cookieString.split(';').map((c) {
      final trimmed = c.trim();
      final idx = trimmed.indexOf('=');
      if (idx < 0) return null;
      try {
        return Cookie(trimmed.substring(0, idx), trimmed.substring(idx + 1));
      } catch (_) {
        return null;
      }
    }).whereType<Cookie>().toList();
    await saveFromResponse(uri, cookies);
  }
}

class ApiClient {
  final Dio _dio;
  final FlutterSecureStorage _storage;
  final WebViewCookieJar cookieJar;

  ApiClient({Dio? dio, FlutterSecureStorage? storage, WebViewCookieJar? cookieJar})
      : _dio = dio ?? Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)),
        _storage = storage ?? const FlutterSecureStorage(),
        cookieJar = cookieJar ?? WebViewCookieJar() {
    // Add cookie manager so Dio sends/receives cookies automatically
    _dio.interceptors.add(CookieManager(this.cookieJar));
    // Also add Bearer token if available
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _storage.read(key: 'auth_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    ));
  }

  Future<String> getToken() async {
    final response = await _dio.get(ApiConstants.getToken);
    final data = response.data as Map<String, dynamic>;
    final result = data['result'] as Map<String, dynamic>;
    final inner = result['data'] as Map<String, dynamic>;
    // Support both 'json' and 'token' field names
    return (inner['json'] ?? inner['token']) as String;
  }

  Future<List<ActiveSession>> listActiveSessions() async {
    final response = await _dio.get(ApiConstants.listActiveSessions);
    final data = response.data as Map<String, dynamic>;
    final result = data['result'] as Map<String, dynamic>;
    final inner = result['data'] as Map<String, dynamic>;
    final json = inner['json'] ?? inner['sessions'];
    if (json is List) {
      return json
          .cast<Map<String, dynamic>>()
          .map(ActiveSession.fromJson)
          .toList();
    }
    return [];
  }

Future<({SessionInfo info, List<StoredMessage> messages})>
      getSessionMessages(String sessionId) async {
    final input = '{"0":{"session_id":"$sessionId"}}';
    final response = await _dio.get(
      ApiConstants.getSessionMessages,
      queryParameters: {'batch': '1', 'input': input},
    );
    final data = response.data;
    if (data is! List || data.isEmpty) {
      return (info: SessionInfo(id: sessionId), messages: <StoredMessage>[]);
    }
    final result = data[0] as Map<String, dynamic>?;
    if (result == null) {
      return (info: SessionInfo(id: sessionId), messages: <StoredMessage>[]);
    }
    final resultData = result['result'] as Map<String, dynamic>?;
    if (resultData == null) {
      return (info: SessionInfo(id: sessionId), messages: <StoredMessage>[]);
    }
    final inner = resultData['data'] as Map<String, dynamic>?;
    if (inner == null) {
      return (info: SessionInfo(id: sessionId), messages: <StoredMessage>[]);
    }
    // tRPC may wrap in 'json' or return data directly
    final payload = (inner['json'] as Map<String, dynamic>?) ?? inner;

    final rawInfo = payload['info'] as Map<String, dynamic>?;
    final info = rawInfo != null
        ? SessionInfo.fromJson(rawInfo)
        : SessionInfo(id: sessionId);

    final rawMessages = payload['messages'] as List? ?? [];
    final messages = <StoredMessage>[];
    for (final m in rawMessages.cast<Map<String, dynamic>>()) {
      try {
        final msgInfo =
            MessageInfo.fromJson(m['info'] as Map<String, dynamic>);
        final rawParts = m['parts'] as List? ?? [];
        final parts = <Part>[];
        for (final p in rawParts.cast<Map<String, dynamic>>()) {
          try {
            parts.add(Part.fromJson(p));
          } catch (_) {
            // Skip unknown part types
          }
        }
        messages.add(StoredMessage(info: msgInfo, parts: parts));
      } catch (_) {
        // Skip unparseable messages
      }
    }
    return (info: info, messages: messages);
  }

  Future<List<Map<String, dynamic>>> fetchModels() async {
    final response = await _dio.get(ApiConstants.openRouterModels);
    final data = response.data;
    if (data is List) return data.cast<Map<String, dynamic>>();
    if (data is Map && data['data'] is List) {
      return (data['data'] as List).cast<Map<String, dynamic>>();
    }
    return [];
  }

  Future<({String code, String verificationUrl})>
      createDeviceAuthCode() async {
    final response = await _dio.post(ApiConstants.deviceAuthCodes);
    final data = response.data as Map<String, dynamic>;
    return (
      code: data['code'] as String,
      verificationUrl: data['verificationUrl'] as String
    );
  }

  Future<({bool approved, String? token})> pollDeviceAuth(String code) async {
    final response = await _dio.get(
      '${ApiConstants.deviceAuthCodes}/$code',
      options: Options(validateStatus: (s) => s != null && s < 500),
    );
    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      return (approved: true, token: data['token'] as String?);
    }
    if (response.statusCode == 410) {
      throw Exception('Device auth code expired');
    }
    return (approved: false, token: null);
  }

  void setAuthCookie(String cookie) {
    _dio.options.headers['Cookie'] = cookie;
  }
}
