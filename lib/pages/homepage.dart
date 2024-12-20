import 'package:flutter/material.dart';
import 'signup.dart'; // Ensure this is correctly imported

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      // If the form is valid, proceed with login
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }

  void _navigateToSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignupPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header image
            Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Card with deep orange background and white text, no rounded corners
            Card(
              color: const Color.fromARGB(
                  255, 59, 53, 52), // Deep orange background for the card
              elevation: 10,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // No rounded corners
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Form for input fields and validation
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Username Field
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                prefixIcon:
                                    Icon(Icons.person, color: Colors.white),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Password Field with error handling
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                prefixIcon:
                                    Icon(Icons.lock, color: Colors.white),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 8),

                          const SizedBox(height: 24),

                          // Login Button
                          ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white, // White background
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 14,
                              ),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(
                                    255, 250, 69, 13), // Deep orange text
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Signup Button
                          TextButton(
                            onPressed: _navigateToSignup,
                            child: const Text(
                              'Don’t have an account? Signup',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}
