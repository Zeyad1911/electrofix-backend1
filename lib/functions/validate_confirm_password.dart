String? confirmPasswordValidator(String value, String password) {
  if (value.isEmpty) {
    return 'Confirm password cannot be empty.';
  } else if (value != password) {
    return 'Passwords do not match.';
  }
  return null; // Valid confirmation
}
