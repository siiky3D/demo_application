import 'package:equatable/equatable.dart';
import 'package:netflix_clone/src/domain/entities/movie/cast_entity.dart';
import 'package:netflix_clone/src/domain/entities/movie/crew_entity.dart';

class MovieCreditEntity extends Equatable {
  const MovieCreditEntity({this.id, this.cast, this.crew});
  final int? id;
  final List<CastEntity>? cast;
  final List<CrewEntity>? crew;

  @override
  List<Object?> get props => [id, cast, crew];
}
