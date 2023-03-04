import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smdc/scr/config/router/app_router.gr.dart';
import 'package:smdc/scr/locator.dart';
import 'package:smdc/scr/presentation/signIn/sign_in_bloc.dart';
import 'package:smdc/scr/presentation/mainPage.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final passwordKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormState>();
  final AppRouter router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInFailure) {
            final SnackBar snackBar = SnackBar(content: Text(state.error));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is SighnInSuccessful) {
            locator<AppRouter>().push(MainRouteWidget());
          }
        },
        builder: (context, state) {
          if (state is IsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Вход', style: TextStyle(fontSize: 22)),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: emailKey,
                  child: TextFormField(
                    onChanged: (value) => emailKey.currentState!.validate(),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(
                              r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: passwordKey,
                  child: TextFormField(
                    onChanged: (value) => passwordKey.currentState!.validate(),
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter your password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        child: Text('log in'),
        onPressed: () => BlocProvider.of<SignInBloc>(context)
            .add(SignIn(emailController.text, passwordController.text)),
      ),
    );
  }
}
