import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// Save data securely
  Future<void> save(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Retrieve data securely
  Future<String?> read(String key) async {
    return _storage.read(key: key);
  }

  /// Delete data securely
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  /// Delete all data securely
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  /// Check if a key exists
  Future<bool> containsKey(String key) async {
    return _storage.containsKey(key: key);
  }
}
