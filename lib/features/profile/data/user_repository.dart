import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/api/api_constants.dart';
import '../../../core/models/usage_stats.dart';

class UserProfile {
  final String id;
  final String email;
  final String name;
  final String image;

  const UserProfile({
    required this.id,
    required this.email,
    required this.name,
    required this.image,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );
  }
}

class UserRepository {
  final Dio _dio;
  final FlutterSecureStorage _storage;
  static const _tokenKey = 'auth_token';

  UserRepository({
    Dio? dio,
    FlutterSecureStorage? storage,
  })  : _dio = dio ?? Dio(BaseOptions(baseUrl: ApiConstants.baseUrl)),
        _storage = storage ?? const FlutterSecureStorage();

  Future<String?> _getToken() => _storage.read(key: _tokenKey);

  Future<Map<String, dynamic>?> getUserFromToken() async {
    final token = await _getToken();
    if (token == null) return null;

    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      final payload = parts[1];
      final normalized = base64Url.normalize(payload);
      final decoded = utf8.decode(base64Url.decode(normalized));
      return jsonDecode(decoded) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }

  Future<UserProfile> getUserProfile() async {
    final token = await _getToken();
    if (token == null) throw Exception('Not authenticated');

    final response = await _dio.get(
      ApiConstants.profileMe,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    final data = response.data as Map<String, dynamic>;
    final user = data['user'] as Map<String, dynamic>;
    return UserProfile.fromJson(user);
  }

  String? getKiloUserId(Map<String, dynamic>? userData) {
    return userData?['kiloUserId'] as String?;
  }

  Future<List<UsagePeriod>> getUsageStats({
    UsagePeriodType period = UsagePeriodType.week,
    bool groupByModel = false,
  }) async {
    final token = await _getToken();
    if (token == null) throw Exception('Not authenticated');

    final periodStr = period.name;
    final response = await _dio.get(
      ApiConstants.profileUsage,
      queryParameters: {
        'period': periodStr,
        'groupByModel': groupByModel,
      },
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    final data = response.data as Map<String, dynamic>;
    final usage = data['usage'] as List<dynamic>? ?? [];

    return usage
        .cast<Map<String, dynamic>>()
        .map((e) => UsagePeriod(
              date: e['date'] as String? ?? '',
              totalCost: (e['total_cost'] as num?)?.toDouble() ?? 0,
              requestCount: (e['request_count'] as num?)?.toDouble() ?? 0,
              totalInputTokens: (e['total_input_tokens'] as num?)?.toDouble() ?? 0,
              totalOutputTokens: (e['total_output_tokens'] as num?)?.toDouble() ?? 0,
              totalCacheWriteTokens: (e['total_cache_write_tokens'] as num?)?.toDouble(),
              totalCacheHitTokens: (e['total_cache_hit_tokens'] as num?)?.toDouble(),
              model: e['model'] as String?,
            ))
        .toList();
  }

  Future<UserBalance> getBalance() async {
    final token = await _getToken();
    if (token == null) throw Exception('Not authenticated');

    final response = await _dio.get(
      ApiConstants.profileBalance,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    final data = response.data as Map<String, dynamic>;
    return UserBalance(
      balance: (data['balance'] as num?)?.toDouble() ?? 0,
      isDepleted: data['isDepleted'] as bool? ?? false,
    );
  }
}
