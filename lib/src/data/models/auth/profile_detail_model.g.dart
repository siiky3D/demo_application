// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDetailModel _$ProfileDetailModelFromJson(Map<String, dynamic> json) =>
    ProfileDetailModel(
      id: (json['id'] as num?)?.toInt(),
      image: json['image'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProfileDetailModelToJson(ProfileDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
