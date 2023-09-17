import 'package:flutter/material.dart';

import '../dashboard/overview_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameOrEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false; // Track password visibility

  // Function to handle user login
  void loginUser() {
    String usernameOrEmail = usernameOrEmailController.text;
    String password = passwordController.text;

    // Replace with your actual authentication logic
    // Check if username or email and password are valid
    if (isValidUsernameOrEmail(usernameOrEmail) && isValidPassword(password)) {
      // Successful login, navigate to the dashboard's OverviewScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OverviewScreen(username: usernameOrEmail), // Pass the username or email to OverviewScreen
        ),
      );
    } else {
      // Invalid credentials, show an error message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid credentials. Please try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  // Function to validate username or email
  bool isValidUsernameOrEmail(String usernameOrEmail) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (emailRegex.hasMatch(usernameOrEmail)) {
      // It's an email
      return true;
    } else {
      // It's not an email, you can perform username validation here if needed
      return usernameOrEmail.isNotEmpty; // Basic validation, change as needed
    }
  }

  // Function to validate password length
  bool isValidPassword(String password) {
    return password.length >= 6; // Change the validation criteria as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10.0),
              Text(
                'Continue making smart money decisions',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              // Resizable illustration
              Image.asset(
                'assets/images/login.png', // Replace with your illustration asset path
                fit: BoxFit.fill,
                width: 400.0,
                height: 250.0,
              ),

              // Login Form
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: usernameOrEmailController,
                      decoration: InputDecoration(
                        labelText: 'Username or Email', // Update label text
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: loginUser,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
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
    );
  }
}
