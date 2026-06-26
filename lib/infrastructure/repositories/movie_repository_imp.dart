import 'package:lhz_movies_app/domain/domain.dart';

class MovieRepositoryImp extends MoviesRepository {

  final MoviesDatasource datasource;
  MovieRepositoryImp(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return datasource.getMovieById(id);
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getSimilarMovie(String movieId) {
    return datasource.getSimilarMovie(movieId);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }

  @override
  Future<String> getYoutubeVideoById(String movieId) {
    return datasource.getYoutubeVideoById(movieId);
  }

  @override
  Future<List<Movie>> searchMovie(String query) {
    return datasource.searchMovie(query);
  }

}
