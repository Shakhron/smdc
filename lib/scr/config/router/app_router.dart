import 'package:auto_route/auto_route.dart';
import 'package:smdc/scr/presentation/autorization/autorizationPage.dart';
import 'package:smdc/scr/presentation/autorization/signIn/sign_in_page.dart';
import 'package:smdc/scr/presentation/autorization/signUp/sign_up_page.dart';
import 'package:smdc/scr/presentation/mainPage.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SignInPage),
    AutoRoute(page: MainPage),
    AutoRoute(page: AutorizationPage, initial: true),
    AutoRoute(page: SignUpPage)
  ],
)
class $AppRouter {}
