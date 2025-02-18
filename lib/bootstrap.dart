import 'dart:async';
import 'dart:developer';

import 'package:demo_app_temp/src/app.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:path_provider/path_provider.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  /// Ensure Flutter initialized
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Bloc Observer
  Bloc.observer = const AppBlocObserver();

  /// Load .env file
  await dotenv.load();

  /// Initialize Injection
  await init();

  final directory = HydratedStorageDirectory(
    (await getApplicationDocumentsDirectory()).path,
  );

  /// Initialize HydratedBloc Storage
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: directory,
  );

  runApp(await builder());
}
