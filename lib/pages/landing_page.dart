import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              // Custom Header Section
              Container(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                alignment: Alignment.center,
                child: Text(
                  'Get Started with SIKA PUDUO',
                  style: TextStyle(
                    fontFamily: 'Roboto', // Use the custom font
                    fontSize: 36, // Increased font size
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        offset: const Offset(3.0, 3.0), // Shadow position
                        blurRadius: 6.0, // Blur effect of the shadow
                        color: Colors.black.withOpacity(0.3), // Shadow color
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 40), // Space between header and buttons

              // Sign Up Button with sleek, modern style
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Sign Up page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent, // Set the button color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 8,
                  shadowColor: Colors.orangeAccent.withOpacity(0.5),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'Roboto', // Apply custom font
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space between buttons

              // Login Button with similar style but different color
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Login page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Set the button color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 8,
                  shadowColor: Colors.blueAccent.withOpacity(0.5),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontFamily: 'Roboto', // Apply custom font
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40), // Space between buttons and logos

              // Logos Section (Brand Images)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('lib/images/brand1.png', height: 50), // Brand 1
                  const SizedBox(width: 40),
                  Image.asset('lib/images/brand2.png', height: 50), // Brand 2
                  const SizedBox(width: 40),
                  Image.asset('lib/images/brand3.png', height: 50), // Brand 3
                ],
              ),
              const SizedBox(height: 40), // Space before footer

              // Optional footer text for extra branding
              TextButton(
                onPressed: () {
                  // Add functionality for terms or other links
                },
                child: const Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    fontFamily: 'Roboto', // Apply custom font
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
