/// Validates an email address.
///
/// Returns `true` if the email is valid, `false` otherwise.
bool validateEmail(String email) {
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
}

/// Validates a password.
///
/// Returns `true` if the password is valid, `false` otherwise.
bool validatePasword(String password) {
  return RegExp(r'^(?=.*[A-Z])(?=.*[0-9]).{8,}$').hasMatch(password);
}