import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lhz_movies_app/presentation/providers/providers.dart'
    show movieRepositoryProvider;

final videosFromMovieProvider = FutureProvider.family((
  ref,
  String movieId,
) async {
  final movierepositoryProvider = ref.watch(movieRepositoryProvider);
  return movierepositoryProvider.getYoutubeVideoById(movieId);
});
