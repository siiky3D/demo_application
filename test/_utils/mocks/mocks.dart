import 'package:demo_app_temp/src/core/network/dio_client.dart';
import 'package:demo_app_temp/src/features/movies/data/data_sources/remote/movie_remote_data_source.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  DioClient,
  MovieRemoteDataSource,
  // MovieLocalDataSource,
  // ActorRemoteDataSource,
  // MovieRepository,
  // ActorRepository,
  // MovieUsecases,
  // ActorUsecases,
])
void main() {}
