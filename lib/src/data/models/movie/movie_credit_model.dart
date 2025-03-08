import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_clone/src/core/extensions/entity_convertable.dart';
import 'package:netflix_clone/src/data/models/movie/cast_model.dart';
import 'package:netflix_clone/src/data/models/movie/crew_model.dart';
import 'package:netflix_clone/src/domain/entities/movie/movie_credit_entity.dart';

part 'movie_credit_model.g.dart';

@JsonSerializable()
class MovieCreditModel extends Equatable
    with EntityConvertible<MovieCreditModel, MovieCreditEntity> {
  const MovieCreditModel({this.id, this.cast, this.crew});

  factory MovieCreditModel.fromJson(Map<String, dynamic> json) {
    return _$MovieCreditModelFromJson(json);
  }
  final int? id;
  final List<CastModel>? cast;
  final List<CrewModel>? crew;

  Map<String, dynamic> toJson() => _$MovieCreditModelToJson(this);

  @override
  List<Object?> get props => [id, cast, crew];

  @override
  MovieCreditEntity toEntity() => MovieCreditEntity(
        id: id,
        cast: cast?.map((e) => e.toEntity()).toList(),
        crew: crew?.map((e) => e.toEntity()).toList(),
      );
}
