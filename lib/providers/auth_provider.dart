import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ficlat_frontend/services/auth_service.dart';
import 'package:ficlat_frontend/models/user.dart';

class AuthProvider extends ChangeNotifier{
  final AuthService _authService = AuthService();
  User? _user;
  String? _accessToken;
  
  User? get user=> _user;
  String? get accessToken => _accessToken;

  Future<void> login(String email, String password) async {
    final data = await _authService.login(email, password);
    if(data['success']){
      _user = User.fromJson(data['user']);
      _accessToken = data['accessToken'];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("accessToken", _accessToken!);
      notifyListeners();
    }
    else {
      throw Exception(data['message']);
    }
  }

  Future<void> register(String email, String password) async {
    final data = await _authService.register(email, password);
    if(data['success']) {
      throw Exception(data['message']);
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("accessToken");
    _user = null;
    _accessToken = null;
    notifyListeners();
  }
}