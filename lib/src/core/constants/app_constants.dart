import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static final baseUrl =
      '${dotenv.env['API_BASE_URL']}'; //* https://api.themoviedb.org/3

  static final apiToken =
      '${dotenv.env['API_ACCESS_TOKEN']}'; //* your TMDB token
}
