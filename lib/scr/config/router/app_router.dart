import 'package:auto_route/auto_route.dart';
import 'package:smdc/scr/presentation/signIn/sign_in_page.dart';
import 'package:smdc/scr/presentation/mainPage.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SignInPage, initial: true),
    AutoRoute(page: MainPage)
  ],
)
class $AppRouter {}
