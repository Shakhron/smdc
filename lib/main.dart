import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smdc/scr/config/router/app_router.gr.dart';
import 'package:smdc/scr/config/themes/app_themes.dart';
import 'package:smdc/scr/locator.dart';
import 'package:smdc/scr/presentation/signIn/sign_in_bloc.dart';

Client client = Client();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(BlocProvider(
    create: (context) => SignInBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Smdc',
      theme: AppTheme.light,
      routerDelegate: locator<AppRouter>().delegate(),
      routeInformationParser: locator<AppRouter>().defaultRouteParser(),
    );
  }
}
