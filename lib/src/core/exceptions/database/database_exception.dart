import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

class DatabaseException extends Equatable implements Exception {
  DatabaseException.fromIsarError(IsarError isarError)
      : message = isarError.message;
  late final String message;

  @override
  List<Object?> get props => [message];
}
