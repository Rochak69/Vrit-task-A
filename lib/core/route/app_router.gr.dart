// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i9;
import 'package:lookup/features/homepage/data/model/picture_response.dart'
    as _i8;
import 'package:lookup/features/homepage/presentation/screens/home_screen.dart'
    as _i2;
import 'package:lookup/features/login/presentation/screens/login_screen.dart'
    as _i3;
import 'package:lookup/features/preloader/presentation/preloader_screen.dart'
    as _i4;
import 'package:lookup/features/profile/profile_screen.dart' as _i5;
import 'package:lookup/features/splash/screen/splash_screen.dart' as _i6;
import 'package:lookup/features/video_page/presentation/screen/video_screen.dart'
    as _i1;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    FullPictureRoute.name: (routeData) {
      final args = routeData.argsAs<FullPictureRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.FullPictureScreen(
          picture: args.picture,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    PreloaderRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PreloaderScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProfileScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.FullPictureScreen]
class FullPictureRoute extends _i7.PageRouteInfo<FullPictureRouteArgs> {
  FullPictureRoute({
    required _i8.PictureResponse picture,
    _i9.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          FullPictureRoute.name,
          args: FullPictureRouteArgs(
            picture: picture,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FullPictureRoute';

  static const _i7.PageInfo<FullPictureRouteArgs> page =
      _i7.PageInfo<FullPictureRouteArgs>(name);
}

class FullPictureRouteArgs {
  const FullPictureRouteArgs({
    required this.picture,
    this.key,
  });

  final _i8.PictureResponse picture;

  final _i9.Key? key;

  @override
  String toString() {
    return 'FullPictureRouteArgs{picture: $picture, key: $key}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PreloaderScreen]
class PreloaderRoute extends _i7.PageRouteInfo<void> {
  const PreloaderRoute({List<_i7.PageRouteInfo>? children})
      : super(
          PreloaderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PreloaderRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileRoute extends _i7.PageRouteInfo<void> {
  const ProfileRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashScreen]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
