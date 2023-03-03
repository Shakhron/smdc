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
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;
import 'package:smdc/scr/presentation/autorizationWidget.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    AutorizationWidget.name: (routeData) {
      final args = routeData.argsAs<AutorizationWidgetArgs>(
          orElse: () => const AutorizationWidgetArgs());
      return _i2.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.AutorizationWidget(key: args.key),
      );
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(
          AutorizationWidget.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [_i1.AutorizationWidget]
class AutorizationWidget extends _i2.PageRouteInfo<AutorizationWidgetArgs> {
  AutorizationWidget({_i3.Key? key})
      : super(
          AutorizationWidget.name,
          path: '/',
          args: AutorizationWidgetArgs(key: key),
        );

  static const String name = 'AutorizationWidget';
}

class AutorizationWidgetArgs {
  const AutorizationWidgetArgs({this.key});

  final _i3.Key? key;

  @override
  String toString() {
    return 'AutorizationWidgetArgs{key: $key}';
  }
}
