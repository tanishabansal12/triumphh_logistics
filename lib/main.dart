import 'package:flutter/material.dart';
import 'screens.dart';
import 'signup_screen.dart'; // Import the SignUpScreen here

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'Images/logo.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedButton(text: 'User Sign In', isGradient: false),
                  SizedBox(width: 10),
                  RoundedButton(text: 'Admin Sign In', isGradient: true),
                  SizedBox(width: 10),
                  RoundedButton(text: 'Driver Sign In', isGradient: false),
                ],
              ),
              SizedBox(height: 40),
              CombinedGradientBox(),
              SizedBox(height: 10),
              TransparentButton(text: 'Forgot Password?', onPressed: () {
                // Add your logic for "Forgot Password?" button here
              }),
              TransparentButton(text: 'Sign-up', onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              }),
            ],
          ),
        ),
        backgroundColor: Color(0xFF231F20),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text('next'),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final bool isGradient;

  RoundedButton({required this.text, required this.isGradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(53),
        color: isGradient ? null : Colors.grey[300],
        gradient: isGradient
            ? LinearGradient(
          colors: [
            Color(0xFFC89A4B),
            Color(0xFFF6E795),
            Color(0xFFCDA154),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )
            : null,
      ),
      child: TextButton(
        onPressed: () {
          if (text == 'User Sign In') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserSignInScreen()),
            );
          } else if (text == 'Admin Sign In') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdminSignInScreen()),
            );
          } else if (text == 'Driver Sign In') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DriverSignInScreen()),
            );
          }
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class CombinedGradientBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Color(0xFFC89A4B),
            Color(0xFFF6E795),
            Color(0xFFCDA154),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[300],
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Password',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          TextField(
            obscureText: true,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[300],
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class TransparentButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed; // Add the onPressed parameter here

  TransparentButton({required this.text, required this.onPressed}); // Add onPressed to the constructor

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, // Use the provided onPressed callback
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
