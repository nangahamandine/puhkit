import 'package:flutter/material.dart';
import 'home_page.dart'; // Import your HomePage

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
            Text(
              'PuhKit',
              style: TextStyle(
                color: Colors.red,
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the HomePage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
