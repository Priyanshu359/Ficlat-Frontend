import 'package:flutter/material.dart';
import '../../../data/models/user.dart';

class AuthProvider with ChangeNotifier{ 
  User? _user;
  bool _loading = false;

  User? get user => _user;
  bool get isLoading => _loading;

  Future<void> mockLogin({required String email, required String role}) async {
    _loading = true; 
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 700));
    _user = User(id: 1, email: email, role: role);
    _loading = false;
    notifyListeners();
  }
  Future<void> mockRegister({ required String email, required String role,}) async {
    _loading = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 900));
    _user = User(id: 2, email: email, role: role);
    _loading = false;
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}