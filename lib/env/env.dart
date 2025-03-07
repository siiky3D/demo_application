import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'TMDB_BASE_URL', obfuscate: true)
  static final String tmdbBaseUrl = _Env.tmdbBaseUrl;

  @EnviedField(varName: 'TMDB_ACCESS_TOKEN', obfuscate: true)
  static final String tmdbAccessToken = _Env.tmdbAccessToken;
}
