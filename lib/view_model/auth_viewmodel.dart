import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../repository/auth_repository.dart';
import '../routes/app_routes.dart';

class AuthViewModel extends GetxController {


  final AuthRepository _authRepository = AuthRepository();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    bool success = await _authRepository.login(
      emailController.text,
      passwordController.text,
    );
    isLoading.value = false;

    if (success) {
      Get.offAllNamed(AppRoutes.userMangment);
    } else {
      Get.snackbar("Error", "Invalid login credentials",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> register() async {
    isLoading.value = true;
    bool success = await _authRepository.register(
      emailController.text,
      passwordController.text,
    );
    isLoading.value = false;

    if (success) {
      Get.offAllNamed(AppRoutes.userMangment);
    } else {
      Get.snackbar("Error", "Registration failed",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> checkLoginStatus() async {
    bool loggedIn = await _authRepository.isLoggedIn();
    if (loggedIn) {
      Get.offAllNamed(AppRoutes.userMangment);
    }
  }

  void logout() async {
    await _authRepository.logout();
    Get.offAllNamed(AppRoutes.login);
  }
}
