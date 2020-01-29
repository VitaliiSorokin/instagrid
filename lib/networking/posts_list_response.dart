import 'package:insta_grid/models/i_post.dart';
import 'package:json_annotation/json_annotation.dart';

part 'posts_list_response.g.dart';

@JsonSerializable()
class PostsListResponse {
  PostsListResponse(this.page, this.totalResults, this.totalPages, this.posts);

  int page;
  @JsonKey(name: 'total_results')
  int totalResults;
  @JsonKey(name: 'total_pages')
  int totalPages;
  @JsonKey(name: 'results')
  List<IPost> posts;

  factory PostsListResponse.fromJson(Map<String, dynamic> json) => _$PostsListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostsListResponseToJson(this);
}