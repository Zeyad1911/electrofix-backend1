String validateUsername(String? value) {
  if (value == null || value.isEmpty) {
    return 'Username cannot be empty.';
  } else if (value.length < 4) {
    return 'Username must be at least 4 characters long.';
  } else if (!RegExp(r'^[a-zA-Z0-9_][a-zA-Z0-9_]*$').hasMatch(value)) {
    return 'Username can only contain letters, numbers, and underscores.';
  } else {
    return 'passed';
  }
}
