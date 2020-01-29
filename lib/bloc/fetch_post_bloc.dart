import 'dart:async';

import 'package:insta_grid/networking/posts_list_response.dart';
import 'package:insta_grid/networking/repository.dart';
import 'base_bloc.dart';

class PostBloc extends Bloc {
  final _repo = Repo();

  final _postsListStream = StreamController<PostsListResponse>();

  Stream<PostsListResponse> get postsStream => _postsListStream.stream;

  void fetchPosts() async {
    var posts = await _repo.fetchPosts();
    _postsListStream.sink.add(posts);
  }

  @override
  void dispose() {
    _postsListStream.close();
  }
}