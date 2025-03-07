import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_clone/src/features/auth/data/data_sources/_mappers/entity_convertable.dart';
import 'package:netflix_clone/src/features/auth/data/model/profile_detail/profile_detail_model.dart';
import 'package:netflix_clone/src/features/auth/domain/entities/export_entities.dart';

part 'profile_listings_model.g.dart';

@JsonSerializable()
class ProfileListingsModel extends Equatable
    with EntityConvertible<ProfileListingsModel, ProfileListingsEntity> {
  const ProfileListingsModel({this.profiles});

  factory ProfileListingsModel.fromJson(Map<String, dynamic> json) {
    return _$ProfileListingsModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$ProfileListingsModelToJson(this);

  final List<ProfileDetailModel>? profiles;

  @override
  ProfileListingsEntity toEntity() => ProfileListingsEntity(
        profiles: profiles?.map((e) => e.toEntity()).toList(),
      );

  @override
  List<Object?> get props => [profiles];
}
