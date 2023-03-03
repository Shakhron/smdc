part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignIn extends SignInEvent {
  final String email;
  final String password;

  SignIn(this.email, this.password);
}
