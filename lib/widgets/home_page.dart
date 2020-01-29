import 'package:flutter/material.dart';
import 'package:insta_grid/bloc/bloc_provider.dart';
import 'package:insta_grid/bloc/fetch_post_bloc.dart';
import 'package:insta_grid/models/i_post.dart';
import 'package:insta_grid/networking/posts_list_response.dart';
import 'package:insta_grid/widgets/insta_post.dart';

import 'insta_post.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    var bloc = BlocProvider.of<PostBloc>(context);
    bloc.fetchPosts();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: StreamBuilder<PostsListResponse>(
          stream: bloc.postsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildPostsList(snapshot.data.posts);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget _buildPostsList(List<IPost> list) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(child: InstaPost(list[index]));
        });
  }
}
