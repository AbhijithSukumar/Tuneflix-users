import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tuneflix_user/routes.dart';
import 'package:tuneflix_user/utilities.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.pushNamed(context, Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, // Light background
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'TUNEFLIX',
                style: TextStyle(
                  fontSize: 32.0, // Adjust heading size as needed
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Standard text color
                ),
              ),
              const SizedBox(height: 20.0), // Add spacing between elements
              Text(
                'Entertainments never ends',
                style: TextStyle(
                  fontSize: 16.0, // Adjust subheading size as needed
                  color: Colors.grey[700], // Standard subheading color
                ),
              ),
              const SizedBox(height: 40.0), // Add spacing below text
              Image.asset(
                TuneFlixImages.splash, // Replace with your image path
                width: 400.0, // Adjust image size as needed
                height: 400.0, // Adjust image size as needed
              ),
            ],
          ),
        ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Replace with your next screen's content
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Screen'),
      ),
      body: const Center(
        child: Text('This is the next screen'),
      ),
    );
  }
}
