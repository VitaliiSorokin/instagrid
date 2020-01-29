// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsListResponse _$PostsListResponseFromJson(Map<String, dynamic> json) {
  return PostsListResponse(
      json['page'] as int,
      json['total_results'] as int,
      json['total_pages'] as int,
      (json['results'] as List)
          ?.map((e) =>
              e == null ? null : IPost.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$PostsListResponseToJson(PostsListResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.posts
    };
