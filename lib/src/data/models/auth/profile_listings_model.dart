import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_clone/src/core/extensions/entity_convertable.dart';
import 'package:netflix_clone/src/data/models/auth/profile_detail_model.dart';
import 'package:netflix_clone/src/domain/entities/auth/profile_listings_entity.dart';

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
