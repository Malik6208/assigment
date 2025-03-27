import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/auth_viewmodel.dart';
import '../routes/app_routes.dart';

class LoginView extends StatelessWidget {
  final AuthViewModel controller = Get.put(AuthViewModel());
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Assign form key
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                    labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }
                  if (!GetUtils.isEmail(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                    labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Obx(() => ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.login(); // Call login only if the form is valid
                  }
                },
                child: controller.isLoading.value
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("Login"),
              )),
              TextButton(
                onPressed: () => Get.toNamed(AppRoutes.register),
                child: Text("Don't have an account? Register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
