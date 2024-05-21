// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuneflix_user/ngrok.dart';
import 'package:tuneflix_user/routes.dart';
import 'package:tuneflix_user/utilities.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Add your logo image here
                Image.asset(
                  TuneFlixImages.login,
                  height: 250.0,
                ),
                const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child:  Text("TUNEFLIX"),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email address";
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)*$")
                        .hasMatch(value)) {
                      return "Invalid email format";
                    }
                    return null;
                  },
                  onSaved: (value) => _email = value!,
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    // Set obscureText to true for password field
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your password";
                    }
                    else if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value)) {
                      return "Invalid password format";
                    }
                    return null;
                  },
                  onSaved: (value) => _password = value!,
                ),
                const SizedBox(height: 10.0),
                TextButton(
                  onPressed: () {
                    // Handle forgot password functionality
                    Navigator.pushNamed(context, Routes.signup);
                  },
                  child: const Text(
                    "Not a user yet ? register",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20.0),
                MaterialButton(
                  color: const Color.fromARGB(255, 9, 36, 50),
                  textColor: Colors.white,
                  onPressed: () async{
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Handle login logic with email and password
                      final response = await http.post(
                        Uri.parse('${Ngrok.url}/login'),
                        body: {
                        'email': _email,
                        'password': _password,
                      }
                      );
                      if(response.statusCode==200)
                      {
                        final prefs = await SharedPreferences.getInstance();
                        var responseData=jsonDecode(response.body);
                        prefs.setString("userID", responseData["_id"]);
                        print("true");
                        Navigator.pushNamed(context, Routes.premium);
                        
                      }
                      else{
                          showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
                                      title: const Text(
                                        "Login failed",
                                        style: TextStyle(color: Colors.blueAccent),
                                      ),
                                      content: const Text("invalid credentials",
                                          style:
                                              TextStyle(color: Colors.black)),
                                      actions: [
                                        TextButton(
                                          child: const Text('OK',
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  });
                        }
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
