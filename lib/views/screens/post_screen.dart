import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/post_view_model.dart';
class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PostViewModel>(context, listen: false).getPosts();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Posts"),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<PostViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (viewModel.posts.isEmpty) {
            return Center(child: Text("No posts available"));
          }
          return ListView.builder(
            itemCount: viewModel.posts.length,
            itemBuilder: (context, index) {
              final post = viewModel.posts[index];
              return Card(
                elevation: 2,
                child: ListTile(
                  leading: Text(post.id.toString(),style: TextStyle(fontSize: 19),),
                  title: Text(post.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  subtitle: Text(post.body),
                ),
              );
            },
          );
        },
      ),

    );
  }


}
