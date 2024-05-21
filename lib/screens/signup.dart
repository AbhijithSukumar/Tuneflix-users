// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuneflix_user/ngrok.dart';
import 'package:tuneflix_user/routes.dart';
import 'package:tuneflix_user/utilities.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  SignupState createState() => SignupState();
}

class SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  String _confirmPassword = "";
  String _name = "";
  String _mobile = "";
  

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
                  TuneFlixImages.signup,
                  height: 150.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Welcome to Tuneflix"),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                  onSaved: (value) => _name = value!,
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
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
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Mobile",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your mobile number";
                    }
                    return null;
                  },
                  onSaved: (value) => _mobile = value!,
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
                    } else if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value)) {
                      return "Invalid password format";
                    }
                    return null;
                  },
                  onSaved: (value) => _password = value!,
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
                    // else if(_password!=value)
                    // {
                    //   return "pasword doesn't match";
                    // }
                    return null;
                  },
                  onSaved: (value) => _confirmPassword = value!,
                ),
                const SizedBox(height: 10.0),
                TextButton(
                  onPressed: () {
                    // Handle forgot password functionality
                  },
                  child: const Text(
                    "Already a user ? Login",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 10.0),
                MaterialButton(
                  color: const Color.fromARGB(255, 9, 36, 50),
                  textColor: Colors.white,
                  onPressed: () async{
                    if (_formKey.currentState!.validate()){
                      _formKey.currentState!.save();
                      // Handle Signup logic with email and password


                      final response = await http.post(
                        Uri.parse('${Ngrok.url}/signup'),
                        body: {
                        'name': _name,
                        'email': _email,
                        'mobile': _mobile,
                        'password': _password,
                      }
                      );
                      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh ${response.body}");
                      Navigator.pushNamed(context,Routes.login); // Close the screen
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
