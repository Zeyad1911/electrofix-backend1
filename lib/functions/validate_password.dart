String? validatePassword(String value) {
  if (value.isEmpty) {
    return 'Password cannot be empty.';
  } else if (value.length < 6) {
    return 'Password must be at least 6 characters long.';
  } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Password must contain at least one uppercase letter.';
  } else if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Password must contain at least one lowercase letter.';
  } else if (!RegExp(r'\d').hasMatch(value)) {
    return 'Password must contain at least one digit.';
  } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    return 'Password must contain at least one special character.';
  }
  return null;
}
