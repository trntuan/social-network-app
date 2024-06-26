class AuthValidators {
  // Create error messages to send.
  static const String emailErrMsg =
      'Invalid Email Address, Please provide a valid email.';
  static const String passwordErrMsg =
      'Password must have at least 6 characters.';
  static const String nameErrMsg = 'name must have at least 3 characters.';

  static const String confirmPasswordErrMsg = "Two passwords don't match.";

// A simple email validator that  checks the presence and position of @
  String? emailValidator(String? val) {
    final String email = val as String;

    // If length of email is <=3 then its invalid
    if (email.length <= 3) {
      return emailErrMsg;
    }

    // Check if it has @
    final hasAtSymbol = email.contains('@');
    // find the position of @
    final indexOfAt = email.indexOf('@');
    // Check numbers of @
    final numbersOfAt = '@'.allMatches(email).length;

    // Valid if has @
    if (!hasAtSymbol) {
      return emailErrMsg;
    }

    // and  if the number of @ is only 1
    if (numbersOfAt != 1) {
      return emailErrMsg;
    }

    //and if  '@' is not first or last character
    if (indexOfAt == 0 || indexOfAt == email.length - 1) {
      return emailErrMsg;
    }

    // Else its valid
    return null;
  }

  // Password validator
  String? passwordVlidator(String? val) {
    final String password = val as String;

    if (password.isEmpty || password.length <= 5) {
      return passwordErrMsg;
    }

    return null;
  }

  String? nameVlidator(String? val) {
    final String name = val as String;

    if (name.isEmpty || name.length <= 2) {
      return nameErrMsg;
    }

    return null;
  }

  // Confirm password
  String? confirmPasswordValidator(String? val, firstPasswordInpTxt) {
    final String firstPassword = firstPasswordInpTxt;
    final String secondPassword = val as String;
    // If either of the password fields is empty
    // Or if their length do not match then we don't need to compare their content
    if (firstPassword.isEmpty ||
        secondPassword.isEmpty ||
        firstPassword.length != secondPassword.length) {
      return confirmPasswordErrMsg;
    }

    //  If two passwords do not match then send an error message
    if (firstPassword != secondPassword) {
      return confirmPasswordErrMsg;
    }

    return null;
  }
}
