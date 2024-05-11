bool validateEmail(String email) {
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
}

bool validatePasword(String password) {
  return RegExp(r'^(?=.*[A-Z])(?=.*[0-9]).{8,}$').hasMatch(password);
}