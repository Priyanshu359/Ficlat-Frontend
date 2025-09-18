import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ficlat_frontend/config/api_constants.dart';
import 'package:ficlat_frontend/models/user.dart';

class AuthService {
  Future<Map<String, dynamic>> register (String email, String password) async {
    final response = await http.post(
      Uri.parse(ApiConstants.register),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> login (String email, String password) async {
    final response = await http.post(
      Uri.parse(ApiConstants.login),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    return jsonDecode(response.body);
  }
}