import 'package:dio/dio.dart' show Dio, BaseOptions;
import 'package:lhz_movies_app/domain/entities/movie.dart';
import 'package:lhz_movies_app/infrastructure/models/moviedb/moviedb_detail.dart';
import 'package:lhz_movies_app/infrastructure/models/moviedb/moviedb_response.dart'
    show MovieDbResponse, MovieDb;
import 'package:lhz_movies_app/infrastructure/mappers/movie_mapper.dart';
import '../../config/constants/environment.dart';
import '../../domain/datasources/movies_datasource.dart';

class MoviedbDatasourceImp extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
      queryParameters: {
        'api_key': Environment.theMoviesDbKey,
        'language': Environment.language,
      },
    ),
  );

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200)
      throw Exception('Movie with id $id not found');

    // TODO: Return Movie
    final detail = MovieDbDetail.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailToEntity(detail);
    return movie;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDbResponse.results
        .map((movieDb) => MovieMapper.movieDbToEntity(movieDb))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    // TODO: implement getPopular
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getSimilarMovie(String movieId) {
    // TODO: implement getSimilarMovie
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    // TODO: implement getTopRated
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    // TODO: implement getUpcoming
    throw UnimplementedError();
  }

  @override
  Future<String> getYoutubeVideoById(String movieId) {
    // TODO: implement getYoutubeVideoById
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> searchMovie(String query) {
    // TODO: implement searchMovie
    throw UnimplementedError();
  }
}
