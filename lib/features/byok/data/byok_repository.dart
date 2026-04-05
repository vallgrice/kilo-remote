import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/models/byok.dart';

class ByokRepository {
  final Dio _dio;
  final FlutterSecureStorage _storage;
  static const _tokenKey = 'auth_token';

  ByokRepository({
    Dio? dio,
    FlutterSecureStorage? storage,
  })  : _dio = dio ?? Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)),
        _storage = storage ?? const FlutterSecureStorage();

  Future<String?> _getToken() => _storage.read(key: _tokenKey);

  Future<List<ByokKey>> list() async {
    final token = await _getToken();
    if (token == null) throw Exception('Not authenticated');

    final input = '{"0":{}}';
    final response = await _dio.get(
      ApiConstants.byokList,
      queryParameters: {'batch': '1', 'input': input},
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    final data = response.data;
    if (data is! List || data.isEmpty) return [];
    final result = data[0] as Map<String, dynamic>?;
    if (result == null) return [];
    final resultData = result['result'] as Map<String, dynamic>?;
    if (resultData == null) return [];
    final resultInner = resultData['data'] as List<dynamic>?;
    if (resultInner == null) return [];
    return resultInner.map((e) => ByokKey.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<Map<String, List<String>>> listSupportedModels() async {
    final token = await _getToken();
    if (token == null) throw Exception('Not authenticated');

    final input = '{"0":{}}';
    final response = await _dio.get(
      ApiConstants.byokSupportedModels,
      queryParameters: {'batch': '1', 'input': input},
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    final data = response.data;
    if (data is! List || data.isEmpty) return {};
    final result = data[0] as Map<String, dynamic>?;
    if (result == null) return {};
    final resultData = result['result'] as Map<String, dynamic>?;
    if (resultData == null) return {};
    final resultInner = resultData['data'] as Map<String, dynamic>?;
    if (resultInner == null) return {};
    return resultInner.map((key, value) => MapEntry(
      key,
      (value as List).map((e) => e.toString()).toList(),
    ));
  }

  Future<ByokKey> create({
    required String providerId,
    required String apiKey,
  }) async {
    final token = await _getToken();
    if (token == null) throw Exception('Not authenticated');

    final input = jsonEncode({
      'provider_id': providerId,
      'api_key': apiKey,
    });
    final response = await _dio.post(
      ApiConstants.byokCreate,
      data: {'batch': '1', 'input': input},
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    final data = response.data;
    final result = data[0] as Map<String, dynamic>?;
    final resultData = result?['result'] as Map<String, dynamic>?;
    final resultInner = resultData?['data'] as Map<String, dynamic>?;
    if (resultInner == null) throw Exception('Failed to create key');
    return ByokKey.fromJson(resultInner);
  }

  Future<ByokKey> update({
    required String id,
    required String apiKey,
  }) async {
    final token = await _getToken();
    if (token == null) throw Exception('Not authenticated');

    final input = jsonEncode({
      'id': id,
      'api_key': apiKey,
    });
    final response = await _dio.post(
      ApiConstants.byokUpdate,
      data: {'batch': '1', 'input': input},
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    final data = response.data;
    final result = data[0] as Map<String, dynamic>?;
    final resultData = result?['result'] as Map<String, dynamic>?;
    final resultInner = resultData?['data'] as Map<String, dynamic>?;
    if (resultInner == null) throw Exception('Failed to update key');
    return ByokKey.fromJson(resultInner);
  }

  Future<void> delete(String id) async {
    final token = await _getToken();
    if (token == null) throw Exception('Not authenticated');

    final input = jsonEncode({'id': id});
    await _dio.post(
      ApiConstants.byokDelete,
      data: {'batch': '1', 'input': input},
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  Future<ByokKey> setEnabled({
    required String id,
    required bool isEnabled,
  }) async {
    final token = await _getToken();
    if (token == null) throw Exception('Not authenticated');

    final input = jsonEncode({
      'id': id,
      'is_enabled': isEnabled,
    });
    final response = await _dio.post(
      ApiConstants.byokSetEnabled,
      data: {'batch': '1', 'input': input},
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    final data = response.data;
    final result = data[0] as Map<String, dynamic>?;
    final resultData = result?['result'] as Map<String, dynamic>?;
    final resultInner = resultData?['data'] as Map<String, dynamic>?;
    if (resultInner == null) throw Exception('Failed to update key');
    return ByokKey.fromJson(resultInner);
  }

  Future<ByokTestResult> testApiKey(String id) async {
    final token = await _getToken();
    if (token == null) throw Exception('Not authenticated');

    final input = jsonEncode({'id': id});
    final response = await _dio.post(
      ApiConstants.byokTestApiKey,
      data: {'batch': '1', 'input': input},
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    final data = response.data;
    final result = data[0] as Map<String, dynamic>?;
    final resultData = result?['result'] as Map<String, dynamic>?;
    final resultInner = resultData?['data'] as Map<String, dynamic>?;
    if (resultInner == null) return ByokTestResult(success: false, message: 'Test failed');
    return ByokTestResult(
      success: resultInner['success'] as bool? ?? false,
      message: resultInner['message'] as String? ?? '',
    );
  }
}
