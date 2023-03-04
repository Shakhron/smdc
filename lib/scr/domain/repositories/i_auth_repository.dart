abstract class IAuthRepository {
  Future signIn({
    required String email,
    required String password,
  });

  Future signUp({
    required email,
    required password,
  });

  Future logOut();

  Future getAccount();
}
