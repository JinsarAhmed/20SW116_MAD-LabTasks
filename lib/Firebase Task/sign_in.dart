// SignInScreen.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:madlabtasks_20sw116/Firebase%20Task/sign_up.dart';
import 'auth_service.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Text('Log In (Firebase)'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: ("Email"),
                    floatingLabelStyle: const TextStyle(color: Colors.black),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black), // Border color when focused
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0))),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: ("Password"),
                    floatingLabelStyle: const TextStyle(color: Colors.black),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black), // Border color when focused
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0))),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.pink[500]),
                onPressed: () async {
                  final String email = _emailController.text.trim();
                  final String password = _passwordController.text.trim();

                  if (email.isNotEmpty && password.isNotEmpty) {
                    final User? user =
                        await _authService.signIn(email, password);
                    if (user != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => HomeScreen(
                                    user: user,
                                  )));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Signed in as: ${user.email}")));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please enter both email and password")));
                  }
                },
                child: const Text('Log In'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Don\'t have an account? Create one!',
                  style: TextStyle(color: Colors.pink),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("HomeScreen"),
      ),
      body: Center(
        child: Container(
          child:
              Text("Welcome ${user.email}, You are signed in the application"),
        ),
      ),
    );
  }
}
