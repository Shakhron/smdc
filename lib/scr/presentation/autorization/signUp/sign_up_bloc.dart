// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smdc/scr/data/auth_repository.dart';
import 'package:smdc/scr/locator.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final _authRepo = locator<AuthRepository>();
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {});
    on<SignUp>((event, emit) async {
      emit(IsLoading());
      try {
        final response = await _authRepo.signUp(
            email: event.email, password: event.password);
        emit(SighnUpSuccessful());
      } catch (e) {
        emit(SignUpFailure(e.toString()));
      }
    });
  }
}

@immutable
abstract class SignUpEvent {}

class SignUp extends SignUpEvent {
  final String email;
  final String password;
  SignUp({
    required this.email,
    required this.password,
  });
}

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class IsLoading extends SignUpState {}

class SighnUpSuccessful extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String error;

  SignUpFailure(this.error);
}
