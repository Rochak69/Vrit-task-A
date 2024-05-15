// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/app/bloc/app_profile_bloc.dart' as _i3;
import '../../features/homepage/data/source/home_data_source.dart' as _i23;
import '../../features/homepage/presentation/bloc/home_bloc.dart' as _i25;
import '../../features/login/data/repository/login_repository_impl.dart'
    as _i14;
import '../../features/login/data/source/login_remote_source.dart' as _i12;
import '../../features/login/domain/repository/login_repository.dart' as _i13;
import '../../features/login/domain/usecase/credential_login_usecase.dart'
    as _i20;
import '../../features/login/domain/usecase/google_login_usecase.dart' as _i22;
import '../../features/login/domain/usecase/sign_up_usecase.dart' as _i16;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i24;
import '../../features/splash/bloc/splash_bloc.dart' as _i17;
import '../../features/video_page/data/repository/feed_video_repository_impl.dart'
    as _i8;
import '../../features/video_page/data/source/feed_video_local_source.dart'
    as _i6;
import '../../features/video_page/domain/repository/feed_video_repository.dart'
    as _i7;
import '../../features/video_page/domain/usecase/get_feed_details_usecase.dart'
    as _i10;
import '../../features/video_page/domain/usecase/update_feed_usecase.dart'
    as _i18;
import '../../features/video_page/presentation/bloc/video_feed_bloc.dart'
    as _i19;
import '../config/environment_helper.dart' as _i5;
import '../dio_provider/dio_api_client.dart' as _i21;
import '../hive/hive_manager.dart' as _i11;
import '../preferences/preferences.dart' as _i15;
import 'dependency_injection.dart' as _i26;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AppProfileBloc>(() => _i3.AppProfileBloc());
    gh.factory<_i4.Dio>(() => registerModule.dio);
    gh.factory<_i5.EnvironmentHelper>(() => _i5.EnvironmentHelper());
    gh.lazySingleton<_i6.FeedVideoLocalSource>(
        () => _i6.FeedVideoLocalSource());
    gh.lazySingleton<_i7.FeedVideoRepository>(
        () => _i8.FeedVideoRepositoryImpl(gh<_i6.FeedVideoLocalSource>()));
    await gh.factoryAsync<_i9.FlutterSecureStorage>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i10.GetFeedDetailsUsecase>(
        () => _i10.GetFeedDetailsUsecase(gh<_i7.FeedVideoRepository>()));
    gh.factory<_i11.HiveManager>(() => registerModule.hiveManager);
    gh.lazySingleton<_i12.LoginRemoteSource>(() => _i12.LoginRemoteSource());
    gh.lazySingleton<_i13.LoginRepository>(
        () => _i14.LoginRepositoryImpl(gh<_i12.LoginRemoteSource>()));
    gh.factory<_i15.Preferences>(() => _i15.Preferences());
    gh.lazySingleton<_i16.SignUpUsecase>(
        () => _i16.SignUpUsecase(gh<_i13.LoginRepository>()));
    gh.factory<_i17.SplashBloc>(() => _i17.SplashBloc());
    gh.lazySingleton<_i18.UpdateFeedDetailsUsecase>(
        () => _i18.UpdateFeedDetailsUsecase(gh<_i7.FeedVideoRepository>()));
    gh.factory<_i19.VideoFeedBloc>(() => _i19.VideoFeedBloc(
          gh<_i10.GetFeedDetailsUsecase>(),
          gh<_i18.UpdateFeedDetailsUsecase>(),
        ));
    gh.lazySingleton<_i20.CredentialLoginUsecase>(
        () => _i20.CredentialLoginUsecase(gh<_i13.LoginRepository>()));
    gh.factory<_i21.DioApiClient>(() => _i21.DioApiClient(
          gh<_i4.Dio>(),
          gh<_i5.EnvironmentHelper>(),
          gh<_i15.Preferences>(),
          gh<_i4.Dio>(),
        ));
    gh.lazySingleton<_i22.GoogleLoginUsecase>(
        () => _i22.GoogleLoginUsecase(gh<_i13.LoginRepository>()));
    gh.factory<_i23.HomeRemoteSource>(
        () => _i23.HomeRemoteSource(gh<_i21.DioApiClient>()));
    gh.factory<_i24.LoginBloc>(() => _i24.LoginBloc(
          gh<_i22.GoogleLoginUsecase>(),
          gh<_i20.CredentialLoginUsecase>(),
          gh<_i16.SignUpUsecase>(),
        ));
    gh.factory<_i25.HomeBloc>(() => _i25.HomeBloc(gh<_i23.HomeRemoteSource>()));
    return this;
  }
}

class _$RegisterModule extends _i26.RegisterModule {}
