import 'package:lhz_movies_app/domain/domain.dart';
import 'package:lhz_movies_app/infrastructure/models/moviedb/moviedb_response.dart';

class movieMapper {
  static Movie movieDbToEntity(MovieDb movieDb) {
    return Movie(
      adult: movieDb.adult,
      backdropPath: (movieDb.backdropPath != '')
      ? 'https://image.tmdb.org/t/p/w500${movieDb.backdropPath}'
      : '',
      genreIds: movieDb.genreIds,
      id: movieDb.id,
      originalLanguage: movieDb.originalLanguage,
      originalTitle: movieDb.originalTitle,
      overview: movieDb.overview,
      popularity: movieDb.popularity,
      posterPath: (movieDb.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500${movieDb.posterPath}'
      : '',
      releaseDate: movieDb.releaseDate,
      title: movieDb.title,
      video: movieDb.video,
      voteAverage: movieDb.voteAverage,
      voteCount: movieDb.voteCount
    );
  }
}