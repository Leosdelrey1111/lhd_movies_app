import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:lhz_movies_app/domain/domain.dart';
import 'package:flutter/material.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final filter = movies.take(6).toList();

    return movies.isNotEmpty
        ? FadeIn(
            child: SizedBox(
              height: 210,
              width: double.infinity,
              child: Swiper(
                scale: 0.9,
                viewportFraction: 0.8,
                autoplay: true,
                pagination: SwiperPagination(
                  margin: const EdgeInsets.only(top: 0),
                  builder: DotSwiperPaginationBuilder(
                    activeColor: colors.primary,
                    color: Colors.black54,
                  ),
                ),
                itemCount: filter.length,
                itemBuilder: (context, index) => _Slide(movie: filter[index]),
              ),
            ),
          )
        : const SizedBox();
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(offset: Offset(0, 10), blurRadius: 10, color: Colors.black45),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            onTap: () {},
            child: Image.network(
              movie.backdropPath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
