import 'package:mockito/annotations.dart';
import 'package:netflix_clone/src/core/network/dio_client.dart';
import 'package:netflix_clone/src/data/data_sources/remote/movie/movie_remote_data_source.dart';

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
