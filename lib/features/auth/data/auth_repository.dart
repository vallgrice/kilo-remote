import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/api/api_client.dart';

class AuthRepository {
  static const _tokenKey = 'auth_token';
  final FlutterSecureStorage _storage;
  final ApiClient _apiClient;

  AuthRepository({
    FlutterSecureStorage? storage,
    ApiClient? apiClient,
  })  : _storage = storage ?? const FlutterSecureStorage(),
        _apiClient = apiClient ?? ApiClient();

  ApiClient get apiClient => _apiClient;

  Future<String?> getSavedToken() => _storage.read(key: _tokenKey);

  Future<void> saveToken(String token) =>
      _storage.write(key: _tokenKey, value: token);

  Future<void> deleteToken() => _storage.delete(key: _tokenKey);

  /// After WebView login, fetch token from tRPC endpoint.
  Future<String> fetchTokenAfterWebViewLogin() async {
    return _apiClient.getToken();
  }

  /// Device Auth: create code
  Future<({String code, String verificationUrl})> createDeviceAuthCode() =>
      _apiClient.createDeviceAuthCode();

  /// Device Auth: poll status
  Future<({bool approved, String? token})> pollDeviceAuth(String code) =>
      _apiClient.pollDeviceAuth(code);
}
