import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smdc/scr/config/router/app_router.gr.dart';
import 'package:smdc/scr/locator.dart';
import 'package:smdc/scr/presentation/autorization/signUp/sign_up_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController comfirmpassword = TextEditingController();
  final comfirmpasswordKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpFailure) {
            final SnackBar snackBar = SnackBar(content: Text(state.error));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is SighnUpSuccessful) {
            locator<AppRouter>().push(MainRoute());
          }
        },
        builder: (context, state) {
          if (state is IsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: comfirmpasswordKey,
                  child: TextFormField(
                    onChanged: (value) =>
                        comfirmpasswordKey.currentState!.validate(),
                    controller: comfirmpassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Comfirm your password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value != passwordController.text) {
                        return 'Пароли не совпадают';
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
          child: Text('sign up'),
          onPressed: () {
            BlocProvider.of<SignUpBloc>(context).add(SignUp(
                email: emailController.text,
                password: passwordController.text));
          }),
    );
  }
}
