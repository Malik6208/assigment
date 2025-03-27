import 'package:get/get.dart';
import 'package:untitled/views/user_form_view.dart';
import '../views/login_view.dart';
import '../views/register_view.dart';
import '../views/user_management_view.dart';

class AppRoutes {
  static const login = "/";
  static const register = "/register";
  static const userMangment = "/userMangment";
  static const addUser = "/addUser";


  static List<GetPage> routes = [
    GetPage(name: login, page: () => LoginView()),
    GetPage(name: register, page: () => RegisterView()),
    GetPage(name: userMangment, page: () => UserManagementView()),
    GetPage(name: addUser, page: () => UserFormView()),

  ];
}
