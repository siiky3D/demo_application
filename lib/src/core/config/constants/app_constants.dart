import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static final baseUrl = '${dotenv.env['API_BASE_URL']}';

  static final apiToken = '${dotenv.env['API_ACCESS_TOKEN']}';

  static const movieImage =
      'https://m.media-amazon.com/images/I/71i6L1vZjiL._AC_SL1058_.jpg';
}
