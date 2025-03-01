import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class NetworkErrorModel extends Equatable {
  const NetworkErrorModel({this.statusCode, this.statusMessage});

  factory NetworkErrorModel.fromJson(Map<String, dynamic> json) {
    return _$NetworkErrorModelFromJson(json);
  }
  @JsonKey(name: 'status_code')
  final int? statusCode;
  @JsonKey(name: 'status_message')
  final String? statusMessage;

  Map<String, dynamic> toJson() => _$NetworkErrorModelToJson(this);

  @override
  List<Object?> get props => [statusCode, statusMessage];
}
