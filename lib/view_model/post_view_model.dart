import 'package:assigment/models/post_model.dart';
import 'package:flutter/material.dart';

import '../services/post_api_service.dart';


class PostViewModel extends ChangeNotifier {
  final PostApiService _apiService = PostApiService();
  List<PostModel> posts = [];
  bool isLoading = false;

  Future<void> getPosts() async {
    isLoading = true;
    notifyListeners();

    try {
      posts = await _apiService.fetchPosts();
    } catch (e) {
      print("Error fetching posts: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
