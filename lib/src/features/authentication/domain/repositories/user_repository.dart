import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/features/authentication/domain/entities/export_entities.dart';
import 'package:uuid/uuid.dart';

@lazySingleton
class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User(const Uuid().v4()),
    );
  }
}
