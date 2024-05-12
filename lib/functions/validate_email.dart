String? validateEmail(String value) {
  if (value.isEmpty) {
    return 'Email address cannot be empty.';
  } else if (!RegExp(r'^[^\s@]+@[^\s@]+\.com$').hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}
