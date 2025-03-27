import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user_models.dart';
import '../view_model/user_viewmodel.dart';
import '../views/user_form_view.dart';

class UserCard extends StatelessWidget {
  final User user;
  final UserViewModel userViewModel = Get.find();

  UserCard({required this.user});

  void showDeleteConfirmation(BuildContext context) {
    Get.defaultDialog(
      title: "Delete User",
      middleText: "Are you sure you want to delete ${user.name}?",
      onConfirm: () {
        userViewModel.deleteUser(user.id);
        Get.back();
      },
      onCancel: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: Icon(Icons.edit), onPressed: () => Get.to(UserFormView(userId: user.id))),
          IconButton(icon: Icon(Icons.delete), onPressed: () => showDeleteConfirmation(context)),
        ],
      ),
    );
  }
}
