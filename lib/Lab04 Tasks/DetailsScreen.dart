import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String? name;
  final String? email;
  final String? gender;
  final String? age;

  DetailsScreen({this.age, this.name, this.email, this.gender});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: $name"),
            Text("Email: $email"),
            Text("Age: $age"),
            Text("Gender: $gender"),
          ],
        ),
      ),
    );
  }
}
