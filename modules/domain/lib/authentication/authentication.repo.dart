import 'package:core/core.dart';

abstract class AuthenticationRepository {
  Future<AppAuthResult> loginWithGoogle();
  // Future<AppAuthResult> loginPhone();
  Future<AppAuthResult> signUpEmail(
      {required String email, required String password});
  Future<AppAuthResult> signInEmail(
      {required String email, required String password});
  Future<AppAuthResult> logout();
  Future<AppAuthResult> deleteAccount();
}
