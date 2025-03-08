// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ProfileDetailEntity extends Equatable {
  final int? id;
  final String? name;
  final String? image;

  const ProfileDetailEntity({
    this.id,
    this.name,
    this.image,
  });

  @override
  List<Object?> get props => [id, name, image];
}
