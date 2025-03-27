import 'package:get/get.dart';
import '../core/network/api_service.dart';
import '../models/user_models.dart';

class UserViewModel extends GetxController {
  var users = <User>[].obs;
  var isLoading = false.obs;
  final ApiService _apiService = ApiService();

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var fetchedUsers = await _apiService.fetchUsers();
      users.assignAll(fetchedUsers.map((u) => User.fromJson(u)).toList());
    } catch (e) {
      Get.snackbar("Error", "Failed to load users");
    } finally {
      isLoading(false);
    }
  }

  void addUser(String name, String job) async {
    try {
      var newUser = await _apiService.addUser(name, job);
      Get.snackbar("Success", "User added: ${newUser['name']}");
      fetchUsers();
    } catch (e) {
      Get.snackbar("Error", "Failed to add user");
    }
  }

  void updateUser(int id, String name, String job) async {
    try {
      var updatedUser = await _apiService.updateUser(id, name, job);
      Get.snackbar("Success", "User updated: ${updatedUser['name']}");
      fetchUsers();
    } catch (e) {
      Get.snackbar("Error", "Failed to update user");
    }
  }

  void deleteUser(int id) async {
    try {
      await _apiService.deleteUser(id);
      Get.snackbar("Success", "User deleted");
      fetchUsers();
    } catch (e) {
      Get.snackbar("Error", "Failed to delete user");
    }
  }
}
