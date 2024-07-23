import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String _email = "";
  String _password = "";
  bool _isLoading = false;
  String _errorMessage = "";


  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  Future<void> login() async {
    _isLoading = true;
    notifyListeners();

    // Simulate a network request
    await Future.delayed(Duration(seconds: 2));

    if (_email == "admin" && _password == "admin") {
      _errorMessage = "";
    } else {
      _errorMessage = "Invalid email or password";
    }

    _isLoading = false;
    notifyListeners();
  }
}
