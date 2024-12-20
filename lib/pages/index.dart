import 'package:flutter/material.dart';
import 'landing_page.dart'; // Import the LandingPage widget

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/1.png'), // Background image
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0), // Padding from the top
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // App Name Section with padding and styling
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 40.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'SIKA ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 250, 249, 249),
                          ),
                        ),
                        TextSpan(
                          text: 'PUDUO',
                          style: TextStyle(
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Description Text Section
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    'A reliable platform for fast and secure payments. Get started with ease!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                const SizedBox(height: 60),

                // Get Started Button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the LandingPage when clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LandingPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 100),

                // Logos Section (Brand Images)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('lib/images/brand1.png', height: 50), // Brand 1
                    const SizedBox(width: 70),
                    Image.asset('lib/images/brand2.png', height: 50), // Brand 2
                    const SizedBox(width: 70),
                    Image.asset('lib/images/brand3.png', height: 50), // Brand 3
                    const SizedBox(width: 70),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
