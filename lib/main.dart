import 'package:flutter/material.dart';
import 'package:puhkit/screens/authentication/login_screen.dart';
import 'package:puhkit/screens/authentication/welcome_screen.dart';
import 'package:puhkit/screens/dashboard/overview_screen.dart';

void main() {
  runApp(const PuhKit());
}

class PuhKit extends StatelessWidget {
  const PuhKit({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/dashboard/overview': (context) => OverviewScreen(),
        '/authentication/login_screen': (context) => LoginScreen(),
        // Add other routes here
      },
      initialRoute: '/login',
      title: 'PuhKit App',
      theme: ThemeData(
        // Define your app's theme here using the brand colors you mentioned
        primaryColor: Colors.red, // Replace with your red color
        backgroundColor: Colors.white, // Replace with your white color
        // Add more theme settings as needed
      ),
      home: WelcomeScreen(), // Start with the login screen
    );
  }
}
