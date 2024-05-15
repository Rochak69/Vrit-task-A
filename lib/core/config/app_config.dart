import 'package:lookup/build_variants/enum.dart';

class AppConfiguration {
  AppConfiguration({
    required this.baseUrl,
    required this.appEnvironment,
  });
  final String baseUrl;

  final AppEnvironment appEnvironment;

  static final development = AppConfiguration(
    baseUrl: 'https://api.pexels.com/v1/',
    appEnvironment: AppEnvironment.development,
  );

  static final production = AppConfiguration(
    baseUrl: 'https://api.pexels.com/v1/',
    appEnvironment: AppEnvironment.production,
  );
  static final staging = AppConfiguration(
    baseUrl: 'https://api.pexels.com/v1/',
    appEnvironment: AppEnvironment.staging,
  );
}
