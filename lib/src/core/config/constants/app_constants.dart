import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static final baseUrl = '${dotenv.env['API_BASE_URL']}';

  static final apiToken = '${dotenv.env['API_ACCESS_TOKEN']}';

  static const imageUrl = 'https://image.tmdb.org/t/p/w500';

  static const movieImage =
      'https://m.media-amazon.com/images/I/71i6L1vZjiL._AC_SL1058_.jpg';
  static const movieImage2 =
      'https://m.media-amazon.com/images/I/71i6L1vZjiL._AC_SL1058_.jpg';
  static const movieImage3 =
      'https://captown.capcom.com/uploads/museum_image/image/306/DMC5_%E3%83%A1%E3%82%A4%E3%83%B3%E3%83%92%E3%82%99%E3%82%B7%E3%82%99%E3%83%A5%E3%82%A2%E3%83%AB.jpg';
}
