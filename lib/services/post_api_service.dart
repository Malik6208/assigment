import 'dart:convert';
import 'package:assigment/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostApiService {
  static const String baseUrl = "https://jsonplaceholder.typicode.com/posts";
// This function used to fetching data from api
  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load posts");
    }
  }
}
