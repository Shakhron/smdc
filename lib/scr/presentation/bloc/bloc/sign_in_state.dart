part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class IsLoading extends SignInState {}

class SighnInSuccessful extends SignInState {}

class SignInFailure extends SignInState {
  final String error;

  SignInFailure(this.error);
}
