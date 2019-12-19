import 'dart:async';

class SignInBloc {
  StreamController _emailController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;

  bool CheckValidSignIn(String email, String pass) {
    if (email == null || email.length < 6 || !email.contains("@")) {
      _emailController.sink.addError("Email Invalid");
      return false;
    }

    _emailController.add("OK");
    if (pass == null || pass.length < 6) {
      _passController.sink.addError("Email Invalid");
      return false;
    }
    _passController.add("OK");

    return true;
  }
}
