import 'package:flutter/material.dart';
import 'package:lhz_movies_app/config/config.dart';

class MovieRating extends StatelessWidget {
  final double voteAverage;

  const MovieRating({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Icon(Icons.star_half_rounded, color: Colors.amber.shade800),
          const SizedBox(width: 3),
          Text(
            HumanFormats.number(voteAverage, 1),
            style: textStyle.bodyMedium?.copyWith(color: Colors.amber.shade800,),
          ),
        ],
      ),
    );
  }
}
