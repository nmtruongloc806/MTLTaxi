import 'dart:async';

class SignOutBloc {
  StreamController _nameController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get phoneStream => _phoneController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;

  bool CheckValidSignIn(String name,String phone,String email, String pass) {
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
    _nameController.add("OK");
    _phoneController.add("OK");

    return true;
  }
}
