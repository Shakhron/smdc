import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smdc/scr/config/router/app_router.gr.dart';
import 'package:smdc/scr/config/themes/app_themes.dart';
import 'package:smdc/scr/locator.dart';
import 'package:smdc/scr/presentation/autorization/signIn/sign_in_bloc.dart';
import 'package:smdc/scr/presentation/autorization/signUp/sign_up_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<SignInBloc>(create: (BuildContext context) => SignInBloc()),
      BlocProvider<SignUpBloc>(create: (BuildContext context) => SignUpBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerDelegate: locator<AppRouter>().delegate(),
      routeInformationParser: locator<AppRouter>().defaultRouteParser(),
    );
  }
}
