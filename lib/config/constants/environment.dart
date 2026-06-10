import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMoviesDbKey = dotenv.env['MOVIEDB_KEY'] ?? "No hay API Key";
  static String apiUrl = dotenv.env['API_URL'] ?? "No hay API URL";
  static String language = dotenv.env['LANGUAGE'] ?? "No hay idioma";
}
