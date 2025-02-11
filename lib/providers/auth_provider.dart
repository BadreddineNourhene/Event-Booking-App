// import 'package:flutter/material.dart';

// class AuthProvider with ChangeNotifier {
//   bool _isLoggedIn = false;
//   String _userEmail = "";
//   bool get isLoggedIn => _isLoggedIn;

//   void login(String email) {
//     _isLoggedIn = true;
//     _userEmail = email;
//     notifyListeners();
//   }

//   void logout() {
//     _isLoggedIn = false;
//     _userEmail = "";
//     notifyListeners();
//   }

//   void register(String email) {
//     _isLoggedIn = true;
//     _userEmail = email;
//     notifyListeners();
//   }

//   String get userEmail => _userEmail;
// }
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String? _userEmail;
  String? _userPassword;
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  // Getters
  String? get userEmail => _userEmail;
  String? get userPassword => _userPassword;

  // Sign up function
  void signUp(String email, String password) {
    _userEmail = email;
    _userPassword = password;
    _isLoggedIn = true;
    notifyListeners();  // Notify listeners of changes
  }

  // Login function
  bool login(String email, String password) {
    if (_userEmail == email && _userPassword == password) {
      _isLoggedIn = true;
      notifyListeners();
      return true; // Successful login
    }
    return false; // Invalid credentials
  }


  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
