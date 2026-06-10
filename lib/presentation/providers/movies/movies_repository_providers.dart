import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../infrastructure/infrestructura.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImp(MoviedbDatasourceImp());
});
