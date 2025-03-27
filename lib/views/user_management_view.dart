import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/view_model/auth_viewmodel.dart';
import '../view_model/user_viewmodel.dart';
import '../widgets/user_card.dart';

class UserManagementView extends StatelessWidget {
  final UserViewModel userViewModel = Get.put(UserViewModel());
   final AuthViewModel authViewModel=Get.put(AuthViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Management"),
      actions: [
        IconButton(onPressed: (){
          authViewModel.logout();
        }, icon: Icon(Icons.logout,size: 30,))

        ],
      ),
      body: Obx(() {
        if (userViewModel.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: userViewModel.users.length,
          itemBuilder: (context, index) {
            return UserCard(user: userViewModel.users[index]);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed("/addUser"),
        child: Icon(Icons.add),
      ),
    );
  }
}
