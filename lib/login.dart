import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kp_android/registration.dart';
import 'package:kp_android/user.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  User user = User("", "", "");
  String url = "http://localhost:8080/login";
  Future save() async {
    var res = await http.post(url as Uri, headers: {'Context-Type' : 'application/json'}, body: json.encode(
      {
        'username': user.username,
        'password': user.password,
        'roles': user.roles
      }));
    print(res.body);
  }

  void _login() {
    // Implement authentication logic here
    String login = _loginController.text;
    String password = _passwordController.text;
    print('Login: $login, Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login')
        ),
        body: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _loginController,
                decoration: const InputDecoration(
                  labelText: 'Login',
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                      builder: (context) => const Registration(),
                      )
                  );
                },
                child: const Text(
                  'Don\'t have an account? Register here',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}