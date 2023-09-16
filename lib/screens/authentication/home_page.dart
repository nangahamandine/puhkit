import 'package:flutter/material.dart';
import 'package:puhkit/screens/authentication/registration_screen.dart';

import 'login_screen.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Expense tracking made easy',
              style: TextStyle(
                color: Colors.black, // Set text color to black
                fontSize: 24.0, // Adjust font size as needed
                fontWeight: FontWeight.bold, // Apply bold style
              ),
            ),
            SizedBox(height: 20.0),

            // Your resizable illustration
            Image.asset(
              'assets/images/welcome.png', // Replace with your illustration asset path
              fit: BoxFit.fill, // Resize the illustration to fill available space
              width: 350.0, // Set the maximum width of the illustration
              height: 350.0, // Set the maximum height of the illustration
            ),
            SizedBox(height: 20.0),

            ElevatedButton(
              onPressed: () {
                // Navigate to the LoginScreen when the Login button is clicked
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
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
            SizedBox(height: 15.0),

            ElevatedButton(
              onPressed: () {
                // Navigate to the RegistrationScreen when the Register button is clicked
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RegistrationScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Set registration button background color to black
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0), // Increased padding for uniform width
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Apply rounded corners
                ),
              ),
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white, // Set registration button text color to white
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold, // Increase font size for sophistication
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
