
import 'package:insta_grid/networking/posts_list_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';


part 'api.g.dart';

const String baseUrl = 'http://api.themoviedb.org/3/';

//endpoint
const String popularMovies = 'movie/popular';
const String genres = 'genre/movie/list';
const String discover = 'discover/movie';

//query parameters
const String withGenres = 'with_genres';

@RestApi(baseUrl: baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("movie/popular")
  Future<PostsListResponse> getTasks(
      @Query('api_key') String theMovieDBApiKey,
      @Query('page') int page
      );
}