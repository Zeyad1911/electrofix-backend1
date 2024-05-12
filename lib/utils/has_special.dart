bool hasSpecialChars(String text) {
  final specialCharPattern = RegExp(r'^[a-zA-Z0-9]+$');
  return specialCharPattern.hasMatch(text);
}
