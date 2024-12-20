import 'package:flutter/material.dart';
import 'pages/index.dart'; // Import the WelcomeScreen from index.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: const WelcomeScreen(), // Set WelcomeScreen as the first page
    );
  }
}
