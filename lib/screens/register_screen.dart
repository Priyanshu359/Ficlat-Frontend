import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ficlat_frontend/providers/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding (
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true,),
            SizedBox(height: 20,),
            loading 
              ? CircularProgressIndicator()
              : ElevatedButton(
                onPressed: () async {
                  setState(() => loading = true);
                  try {
                    await authProvider.register(emailController.text, passwordController.text);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registeration Successful")));
                    Navigator.pop(context);
                  }
                  catch(e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                  finally {
                    setState(() => loading = false);
                  }
                },
                child: Text("Register"),
              ),
          ],
        ),
      ),
    );
  }
}