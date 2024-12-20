import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Initial opacity set to 0 (transparent)
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Animate the opacity to 1 (fully visible) after the initial build
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF001F54), // Dark navy blue at the top-left
              Color(0xFFF0F1E1), // Light beige in the center
              Color(0xFF001F54), // Dark navy blue at the bottom-right
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Name with animation
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 1),
                child: const Text(
                  "ConsejoCares",
                  style: TextStyle(
                    fontSize: 28, // Larger text size for the app name
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Text color
                  ),
                ),
              ),
              const SizedBox(height: 30), // Space between app name and logo

              // Logo with animation
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 1),
                child: Image.asset(
                  'lib/assets/images/logoback.png', // Update to your image path
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 30), // Space between logo and slogan

              // Slogan or Subtitle with animation
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 1),
                child: const Text(
                  "your voice matters",
                  style: TextStyle(
                    fontSize: 16, // Smaller text size for the slogan
                    color: Colors.black54, // Slightly faded black
                  ),
                ),
              ),
              const SizedBox(height: 50), // Space before buttons

              // Sign In Button with width adjustment
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 1),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Login screen
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // White button background
                    foregroundColor: Colors.black, // Black text
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded button
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ), // Button size
                    minimumSize: Size(200, 50), // Set minimum width and height
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10), // Space between buttons

              // Create an Account Button with black text
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 1),
                child: TextButton(
                  onPressed: () {
                    // Navigate to Register screen
                    Navigator.pushNamed(context, '/register');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black, // Change text color to black
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text("Create an account"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
