import '../core/network/api_service.dart';
import '../core/storage/secure_storage_service.dart';

class AuthRepository {
  final ApiService _apiService = ApiService();
  final SecureStorageService _storageService = SecureStorageService();

  Future<bool> login(String email, String password) async {
    final response = await _apiService.login(email, password);
    if (response != null && response.containsKey("token")) {
      await _storageService.saveToken(response["token"]);
      return true;
    }
    return false;
  }

  Future<bool> register(String email, String password) async {
    final response = await _apiService.register(email, password);
    if (response != null && response.containsKey("token")) {
      await _storageService.saveToken(response["token"]);
      return true;
    }
    return false;
  }

  Future<bool> isLoggedIn() async {
    final token = await _storageService.getToken();
    return token != null;
  }

  Future<void> logout() async {
    await _storageService.clearToken();
  }
}
