import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = "https://reqres.in/api";

  Future<Map<String, dynamic>?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      body: {"email": email, "password": password},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  Future<Map<String, dynamic>?> register(String email, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register"),
      body: {"email": email, "password": password},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }






  Future<List<dynamic>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception("Failed to load users");
    }
  }

  Future<Map<String, dynamic>> addUser(String name, String job) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      body: {"name": name, "job": job},
    );
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> updateUser(int id, String name, String job) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/$id'),
      body: {"name": name, "job": job},
    );
    return json.decode(response.body);
  }

  Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/users/$id'));
    if (response.statusCode != 204) {
      throw Exception("Failed to delete user");
    }
  }
}
