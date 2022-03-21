import 'package:domain/domain.dart';
import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepoImpl extends AuthenticationRepository {
  final FirebaseAuth firebaseAuth;

  AuthenticationRepoImpl({required this.firebaseAuth});
  @override
  Future<AppAuthResult> loginWithGoogle() async {
    final googleSignIn = GoogleSignIn();

    final user = await googleSignIn.signIn();
    if (user == null) {
      return AppAuthResult.errorGeneric;
    } else {
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await firebaseAuth.signInWithCredential(credential);

      return AppAuthResult.signedInWithGoogle;
    }
  }

  @override
  Future<AppAuthResult> logout() async {
    final googleSignIn = GoogleSignIn();
    try {
      if (firebaseAuth.currentUser!.providerData[0].providerId ==
          'google.com') {
        await googleSignIn.disconnect();
      }
      await firebaseAuth.signOut();
      return AppAuthResult.loggedOut;
    } on FirebaseAuthException catch (_) {
      return AppAuthResult.errorGeneric;
    }
  }

  @override
  Future<AppAuthResult> signUpEmail(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      User user = firebaseAuth.currentUser!;
      if (user.emailVerified) {
        await user.sendEmailVerification();
      }
      return AppAuthResult.signedUpWithEmail;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return AppAuthResult.emailAlreadyInUse;
      }
      return AppAuthResult.errorGeneric;
    }
  }

  Future<AppAuthResult> signInPhone(
      {required String verificationId, required String smsCode}) async {
    try {
      await firebaseAuth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode,
        ),
      );
      return AppAuthResult.signedInWithPhone;
    } on FirebaseAuthException catch (_) {
      return AppAuthResult.errorGeneric;
    }
  }

  @override
  Future<AppAuthResult> signInEmail(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      firebaseAuth.currentUser!.getIdToken().then((value) => {});
      User user = firebaseAuth.currentUser!;
      if (user.emailVerified) {
        await user.sendEmailVerification();
      }
      return AppAuthResult.signedInWithEmail;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return AppAuthResult.errorWrongEmail;
        case 'wrong-password':
          return AppAuthResult.errorWrongPassword;
      }
      return AppAuthResult.errorGeneric;
    }
  }

  @override
  Future<AppAuthResult> deleteAccount() async {
    try {
      await firebaseAuth.currentUser!.delete();
      return AppAuthResult.accountDeleted;
    } catch (e) {
      return AppAuthResult.errorGeneric;
    }
  }
}
