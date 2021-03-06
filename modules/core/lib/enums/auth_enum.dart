enum AppAuthResult {
  signedInWithFacebook,
  loginInWithAnotherProvider,
  signedInWithApple,
  signedInWithGoogle,
  signedInWithPhone,
  signedInWithEmail,
  signedUpWithEmail,
  emailAlreadyInUse,
  phoneVerificationCodeSent,
  weekPassword,
  errorGeneric,
  errorWrongEmail,
  errorWrongPassword,
  errorDuplicateEmail,
  loggedOut,
  loginCanceled,
  accountDeleted,
}
