import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

@immutable
abstract class SignUpEvent {}

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
