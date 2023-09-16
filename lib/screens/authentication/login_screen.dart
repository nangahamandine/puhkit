import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false; // Track password visibility

  // Function to handle user login
  void loginUser() {
    String email = emailController.text;
    String password = passwordController.text;

    // Implement your login logic here
    // Example: Check credentials and navigate to the dashboard on success

    if (email.isNotEmpty && password.isNotEmpty) {
      // Replace the below logic with your actual authentication logic
      if (email == 'user@example.com' && password == 'password') {
        // Successful login, navigate to the dashboard or home page
        Navigator.of(context).pushReplacementNamed('/dashboard'); // Replace '/dashboard' with your actual route
      } else {
        // Invalid credentials, show an error message
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid email or password. Please try again.'),
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
                  // fontWeight: FontWeight.bold, // Apply bold style
                ),
              ),
              SizedBox(height: 5.0),

              // Your resizable illustration
              Image.asset(
                'assets/images/login.png', // Replace with your illustration asset path
                fit: BoxFit.fill, // Resize the illustration to fill available space
                width: 400.0, // Set the maximum width of the illustration
                height: 250.0, // Set the maximum height of the illustration
              ),

              // Login Form
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible, // Toggle password visibility
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
                        primary: Colors.black, // Set login button background color to black
                        padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 15.0), // Increased padding for uniform width
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0), // Apply rounded corners
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white, // Set login button text color to white
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold, // Increase font size for sophistication
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
