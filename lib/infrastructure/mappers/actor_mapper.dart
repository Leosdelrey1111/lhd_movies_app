import 'package:lhz_movies_app/domain/domain.dart';
import 'package:lhz_movies_app/infrastructure/models/moviedb/moviedb_credits.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath.isNotEmpty
            ? 'https://image.tmdb.org/t/p/w500/${cast.profilePath}'
            : 'https://digitalhealthskills.com/wp-content/uploads/2022/11/fd35c-no-user-image-icon-27.png',
        character: cast.character,
      );
}
