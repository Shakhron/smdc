import 'package:auto_route/auto_route.dart';
import 'package:smdc/scr/presentation/autorizationWidget.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[AutoRoute(page: AutorizationWidget, initial: true)],
)
class $AppRouter {}
