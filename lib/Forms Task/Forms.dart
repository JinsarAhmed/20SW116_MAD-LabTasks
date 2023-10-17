import 'package:flutter/material.dart';
import 'package:madlabtasks_20sw116/Forms%20Task/DetailsScreen.dart';

void main() {
  runApp(MaterialApp(
    home: Forms(),
  ));
}

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController age = TextEditingController();
  String? gender;

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final RegExp _passwordRegExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*]).{8,}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forms"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Form By 20SW116",
                  style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),

                const SizedBox(
                  height: 15,
                ),

                // username
                TextFormField(
                  controller: name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username can't be null, Please enter some text!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: ("Username"),
                      hintText: "Enter your Username",
                      hintStyle: const TextStyle(color: Colors.black),
                      floatingLabelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black), // Border color when focused
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(12.0))),
                ),

                const SizedBox(
                  height: 15,
                ),

                // email
                TextFormField(
                  controller: email,
                  validator: (value) {
                    if (!value!.contains("@gmail.com")) {
                      return "Entered email is not valid!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: ("Email"),
                      hintText: "Enter your Email",
                      hintStyle: const TextStyle(color: Colors.black),
                      floatingLabelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black), // Border color when focused
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0))),
                ),

                const SizedBox(
                  height: 15,
                ),

                // password
                TextFormField(
                  controller: pass,
                  validator: (value) {
                    if (!_passwordRegExp.hasMatch(value!)) {
                      return "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: ("Password"),
                      hintText: "Enter your Password",
                      hintStyle: const TextStyle(color: Colors.black),
                      floatingLabelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black), // Border color when focused
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0))),
                ),

                const SizedBox(
                  height: 15,
                ),

                TextFormField(
                  controller: age,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Age can't be null!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: ("Age"),
                      hintText: "Enter your age",
                      hintStyle: const TextStyle(color: Colors.black),
                      floatingLabelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black), // Border color when focused
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0))),
                ),

                const SizedBox(
                  height: 15,
                ),

                // gender
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
                    const Text("Select your gender:      "),
                    const Text('Male'),
                    Radio(
                        value: 'Male',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        }),
                    const Text("Female"),
                    Radio(
                        value: 'Female',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        }),
                  ]),
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                    onPressed: () {
                      setState(() {
                        if (_formkey.currentState!.validate() &&
                            _formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "form has been Successfully submitted")));

                          // push the form details to the nextd details screen
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DetailsScreen(
                                        name: name.text,
                                        email: email.text,
                                        age: age.text,
                                        gender: gender,
                                      )));
                        }
                      });
                    },
                    child: const Text("   Submit   ")),
              ],
            ),
          )),
    );
  }
}
