abstract class IAuthRepository {
  Future signIn({
    required String email,
    required String password,
  });
}
