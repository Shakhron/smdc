import 'package:appwrite/appwrite.dart';
import 'package:smdc/scr/domain/repositories/i_auth_repository.dart';
import 'package:smdc/scr/locator.dart';

class AuthRepository implements IAuthRepository {
  final Account _account = locator<Account>();
  @override
  Future signIn({required String email, required String password}) async {
    try {
      await _account.createEmailSession(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future getAccount() async {
    try {
      return await _account.get();
    } on AppwriteException catch (e) {
      rethrow;
    }
  }

  @override
  Future logOut() async {
    try {
      await _account.deleteSession(sessionId: 'current');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future signUp({required email, required password}) async {
    try {
      await _account.create(
          email: email, password: password, userId: 'unique()');
    } catch (e) {
      rethrow;
    }
  }
}
