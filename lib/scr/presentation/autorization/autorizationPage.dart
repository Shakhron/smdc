import 'package:flutter/material.dart';
import 'package:smdc/scr/config/router/app_router.gr.dart';
import 'package:smdc/scr/locator.dart';

class AutorizationPage extends StatelessWidget {
  const AutorizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      locator<AppRouter>().push(SignInRoute());
                    },
                    child: const Text('Вход'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      locator<AppRouter>().push(SignUpRoute());
                    },
                    child: const Text('Регистрация'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
