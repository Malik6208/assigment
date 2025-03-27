import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/user_viewmodel.dart';

class UserFormView extends StatelessWidget {
  final UserViewModel userViewModel = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final int? userId;

  UserFormView({this.userId, Key? key}) : super(key: key);

  void handleSubmit() {
    if (nameController.text.isEmpty || jobController.text.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }

    if (userId == null) {
      userViewModel.addUser(nameController.text, jobController.text);
    } else {
      userViewModel.updateUser(userId!, nameController.text, jobController.text);
    }
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(userId == null ? "Add User" : "Edit User")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(controller: nameController, decoration: InputDecoration(
                labelText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8)
              )
            )),
            SizedBox(height: 15,),
            TextField(controller: jobController, decoration: InputDecoration(
                labelText: "Job",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8)
              )
            )),
            SizedBox(height: 20),
            ElevatedButton(onPressed: handleSubmit, child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
