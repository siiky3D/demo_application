import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_clone/src/features/auth/domain/entities/export_entities.dart';
import 'package:netflix_clone/src/features/movies/data/data_sources/_mappers/entity_convertable.dart';

part 'profile_detail_model.g.dart';

@JsonSerializable()
class ProfileDetailModel extends Equatable
    with EntityConvertible<ProfileDetailModel, ProfileDetailEntity> {
  const ProfileDetailModel({this.id, this.image, this.name});

  factory ProfileDetailModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileDetailModelToJson(this);

  final int? id;
  final String? name;
  final String? image;

  @override
  ProfileDetailEntity toEntity() =>
      ProfileDetailEntity(id: id, image: image, name: name);

  @override
  List<Object?> get props {
    return [id, name, image];
  }
}
