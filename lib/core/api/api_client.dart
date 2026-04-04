import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/message.dart';
import '../models/part.dart';
import '../models/session.dart';
import 'api_constants.dart';

class ApiClient {
  final Dio _dio;
  final FlutterSecureStorage _storage;

  ApiClient({Dio? dio, FlutterSecureStorage? storage})
      : _dio = dio ?? Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)),
        _storage = storage ?? const FlutterSecureStorage() {
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
    return inner['json'] as String;
  }

  Future<List<ActiveSession>> listActiveSessions() async {
    final response = await _dio.get(ApiConstants.listActiveSessions);
    final data = response.data as Map<String, dynamic>;
    final result = data['result'] as Map<String, dynamic>;
    final inner = result['data'] as Map<String, dynamic>;
    final json = inner['json'];
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
    final response = await _dio.get(
      ApiConstants.getSessionMessages,
      queryParameters: {'input': '{"json":"$sessionId"}'},
    );
    final data = response.data as Map<String, dynamic>;
    final result = data['result'] as Map<String, dynamic>;
    final inner = result['data'] as Map<String, dynamic>;
    final json = inner['json'] as Map<String, dynamic>;
    final info = SessionInfo.fromJson(
        json['info'] as Map<String, dynamic>? ?? {'id': sessionId});
    final rawMessages = json['messages'] as List? ?? [];
    final messages = rawMessages.cast<Map<String, dynamic>>().map((m) {
      final msgInfo = MessageInfo.fromJson(m['info'] as Map<String, dynamic>);
      final rawParts = m['parts'] as List? ?? [];
      final parts =
          rawParts.cast<Map<String, dynamic>>().map(Part.fromJson).toList();
      return StoredMessage(info: msgInfo, parts: parts);
    }).toList();
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
