import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ficlat_frontend/providers/auth_provider.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget { 
  @override 
  Widget build (BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await authProvider.logout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
            },
          )
        ],
      ),
      body: Center(
        child: Text("Hello, ${authProvider.user?.email ?? 'User'}"),
      )
    );
  }
}