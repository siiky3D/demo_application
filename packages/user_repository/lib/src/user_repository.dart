import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:user_repository/src/models/models.dart';
import 'package:uuid/uuid.dart';

@LazySingleton()
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
