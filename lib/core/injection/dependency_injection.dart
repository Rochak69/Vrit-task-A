import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/core/hive/hive_manager.dart';

import 'package:lookup/core/injection/dependency_injection.config.dart';

final sl = GetIt.instance;
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async => sl.init();

@module
abstract class RegisterModule {
  @postConstruct
  Dio get dio => Dio();
  @postConstruct
  HiveManager get hiveManager => HiveManager.instance;

  @preResolve
  Future<FlutterSecureStorage> get prefs async => const FlutterSecureStorage();
}
