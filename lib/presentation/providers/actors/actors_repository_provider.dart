import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lhz_movies_app/infrastructure/infrestructura.dart';

final actorsRepositoryProvider = Provider((ref) {
  return MovieRepositoryImp(MoviedbDatasourceImp());
});
