import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Your resizable illustration
              Image.asset(
                'assets/images/registration_illustration.png', // Replace with your illustration asset path
                fit: BoxFit.fill, // Resize the illustration to fill available space
                width: 200.0, // Set the maximum width of the illustration
                height: 200.0, // Set the maximum height of the illustration
              ),
              SizedBox(height: 20.0),

              // Text input for name
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 12.0),

              // Text input for email
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 12.0),

              // Text input for password
              TextFormField(
                obscureText: true, // Hide password
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 20.0),

              // Register button
              ElevatedButton(
                onPressed: () {
                  // Implement registration functionality here
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
