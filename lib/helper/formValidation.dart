String? stringValidation(String? string) =>
    string!.isEmpty ? 'Field cannot be empty' : null;

String? emailValidation(String? email) {
  bool validateEmail = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email!);
  return validateEmail ? null : 'Enter valid email';
}

// String? passwordValidation(String? password) {
//   bool validatePassword =
//       RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$')
//           .hasMatch(password!);
//   return validatePassword ? null : 'Password must be 8 char long.';
// }
String? passwordValidation(String? phone) =>
    phone!.length < 6 ? 'Enter a valid password ' : null;

String? phoneValidation(String? phone) =>
    phone!.length < 10 ? 'Enter a valid phone number ' : null;
