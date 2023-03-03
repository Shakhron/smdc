import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smdc/scr/data/auth_repository.dart';
import 'package:smdc/scr/locator.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final _authRepo = locator<AuthRepository>();
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {
      on<SignIn>((event, emit) async {
        emit(IsLoading());
        try {
          // final response = await _authRepo.signIn(
          //     email: event.email, password: event.password);
          final session = await locator<Account>()
              .createEmailSession(email: 'test@test.com', password: '12345678');
          emit(SighnInSuccessful());
        } catch (e) {
          print(e);
        }
      });
    });
  }
}
