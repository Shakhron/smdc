// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../presentation/signIn/sign_in_page.dart' as _i1;
import '../../presentation/mainPage.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AutorizationWidget.name: (routeData) {
      final args = routeData.argsAs<AutorizationWidgetArgs>(
          orElse: () => const AutorizationWidgetArgs());
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.SignInPage(key: args.key),
      );
    },
    MainRouteWidget.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          AutorizationWidget.name,
          path: '/',
        ),
        _i3.RouteConfig(
          MainRouteWidget.name,
          path: '/main-page-widget',
        ),
      ];
}

/// generated route for
/// [_i1.SignInPage]
class AutorizationWidget extends _i3.PageRouteInfo<AutorizationWidgetArgs> {
  AutorizationWidget({_i4.Key? key})
      : super(
          AutorizationWidget.name,
          path: '/',
          args: AutorizationWidgetArgs(key: key),
        );

  static const String name = 'AutorizationWidget';
}

class AutorizationWidgetArgs {
  const AutorizationWidgetArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'AutorizationWidgetArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.MainPage]
class MainRouteWidget extends _i3.PageRouteInfo<void> {
  const MainRouteWidget()
      : super(
          MainRouteWidget.name,
          path: '/main-page-widget',
        );

  static const String name = 'MainRouteWidget';
}
