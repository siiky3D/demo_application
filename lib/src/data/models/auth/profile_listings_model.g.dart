// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_listings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileListingsModel _$ProfileListingsModelFromJson(
        Map<String, dynamic> json) =>
    ProfileListingsModel(
      profiles: (json['profiles'] as List<dynamic>?)
          ?.map((e) => ProfileDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileListingsModelToJson(
        ProfileListingsModel instance) =>
    <String, dynamic>{
      'profiles': instance.profiles,
    };
