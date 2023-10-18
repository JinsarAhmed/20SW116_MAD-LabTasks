import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:madlabtasks_20sw116/Firebase%20Task/auth_service.dart';

// tasks done by 20sw116

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _signUpWithEmailAndPassword() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Signup failed: $error'),
      ));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthService auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "         Sign Up using \nFirebase Authentication",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 10),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[600]),
                    onPressed: _signUpWithEmailAndPassword,
                    child: const Text('    Sign Up    '),
                  ),
          ],
        ),
      ),
    );
  }
}
