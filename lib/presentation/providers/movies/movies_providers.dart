import 'package:flutter_riverpod/legacy.dart';
import 'package:lhz_movies_app/presentation/providers/movies/movies_repository_providers.dart';

import '../../../domain/entities/movie.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<moviesNotifier, List<Movie>>((ref) {
      final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
      return moviesNotifier(fetchMoreMovies: fetchMoreMovies);
    });

typedef MoviesCallback = Future<List<Movie>> Function({int page});

class moviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MoviesCallback fetchMoreMovies;
  moviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    currentPage++;
    final newMovies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...newMovies];

    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
