// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ProfileDetailEntity extends Equatable {
  final String name;
  final String image;

  const ProfileDetailEntity({
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [name, image];
}
