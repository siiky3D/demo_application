import 'package:demo_app_temp/src/features/movies/domain/entities/movie_credit/cast_entity.dart';
import 'package:demo_app_temp/src/features/movies/domain/entities/movie_credit/crew_entity.dart';
import 'package:equatable/equatable.dart';

class MovieCreditEntity extends Equatable {

  const MovieCreditEntity({this.id, this.cast, this.crew});
  final int? id;
  final List<CastEntity>? cast;
  final List<CrewEntity>? crew;

  @override
  List<Object?> get props => [id, cast, crew];
}
