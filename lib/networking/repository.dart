import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:insta_grid/models/i_post.dart';
import 'package:insta_grid/networking/posts_list_response.dart';

import 'api.dart';

//class Repo {
//  static final Repo _instance = Repo._internal();
//
//  factory Repo() {
//    return _instance;
//  }
//
//  Repo._internal();
//
//  Future<List<IPost>> fetchPosts() async {
//    List<IPost> newsSubs;
//    String link =
//        "https://newsapi.org/v2/top-headlines?country=us&apiKey=27d0754b351e4f3886839fbdcbb2c14b";
//    var res = await http
//        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
//    print(res.body);
//    if (res.statusCode == 200) {
//      var data = json.decode(res.body);
//      var rest = data["articles"] as List;
//      print(rest);
//      newsSubs = rest.map<IPost>((json) => IPost.fromJson(json)).toList();
//    }
//    print("List Size: ${newsSubs.length}");
//    return newsSubs;
//  }
//
//}

class Repo {
  static final Repo _instance = Repo._internal();

  Repo._internal() {
    _restClient = RestClient(_dioClient);
  }

  Dio _dioClient = Dio();
  final String theMovieDBAPIKey = '3d0d567b896c722ab267ed068e5cf805';
  final int pageNumber = 1;
  RestClient _restClient;

  factory Repo() {
    return _instance;
  }

  Future<PostsListResponse> fetchPosts() =>
   _restClient.getTasks(theMovieDBAPIKey, pageNumber);
}

