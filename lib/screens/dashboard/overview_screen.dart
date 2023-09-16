import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overview'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout), // Add a logout icon or button
            onPressed: () {
              // Implement logout logic here
              // Typically, this would involve clearing user session or tokens
              // and navigating back to the login screen
              Navigator.pushReplacementNamed(context, '/login'); // Replace with your login route
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Overview Screen!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Add your content here
          ],
        ),
      ),
    );
  }
}
