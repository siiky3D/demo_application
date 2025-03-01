import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:netflix_clone/injector.config.dart';

final injector = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => injector.init();
