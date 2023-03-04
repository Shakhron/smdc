import 'package:appwrite/appwrite.dart';
import 'package:smdc/scr/domain/repositories/i_auth_repository.dart';
import 'package:smdc/scr/locator.dart';

class AuthRepository implements IAuthRepository {
  final Account _account = locator<Account>();
  @override
  Future signIn({required String email, required String password}) async {
    try {
      final session =
          await _account.createEmailSession(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}
