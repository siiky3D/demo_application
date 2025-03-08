import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:netflix_clone/src/data/data_sources/local/movie/collections/movie_detail_collection.dart';
import 'package:path_provider/path_provider.dart';

@lazySingleton
class LocalDatabase {
  late final Isar _isar;
  bool _isInitialized = false;

  Isar get db => _isInitialized
      ? _isar
      : throw IsarError('Isar has not been initialized.');

  Future<void> initialize() async {
    if (_isInitialized) throw IsarError('Isar has already been initialized.');

    final directory = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [MovieDetailCollectionSchema],
      directory: directory.path,
    );

    _isInitialized = true;
  }
}
