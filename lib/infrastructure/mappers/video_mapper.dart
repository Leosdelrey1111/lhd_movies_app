import 'package:lhz_movies_app/infrastructure/models/moviedb/movie_videos_response.dart';

import '../../domain/domain.dart';

class VideoMapper {
  static movieDbVideoToEntity(Result video) => Video(
    id: video.id,
    name: video.name,
    youtubeKey: video.key,
    publishedAt: video.publishedAt,
  );
}
