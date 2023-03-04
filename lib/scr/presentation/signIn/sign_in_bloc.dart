import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smdc/scr/data/auth_repository.dart';
import 'package:smdc/scr/locator.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final _authRepo = locator<AuthRepository>();
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {});
    on<SignIn>((event, emit) async {
      emit(IsLoading());
      try {
        final response = await _authRepo.signIn(
            email: event.email, password: event.password);

        emit(SighnInSuccessful());
      } catch (e) {
        emit(SignInFailure(e.toString()));
      }
    });
  }
}

@immutable
abstract class SignInEvent {}

class SignIn extends SignInEvent {
  final String email;
  final String password;

  SignIn(this.email, this.password);
}

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class IsLoading extends SignInState {}

class SighnInSuccessful extends SignInState {}

class SignInFailure extends SignInState {
  final String error;

  SignInFailure(this.error);
}
