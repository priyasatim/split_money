import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:split_money/SignInPage.dart';
import 'package:firebase_database/firebase_database.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Check if the user is already signed in
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    // If user is logged in, navigate to home, else to sign in page
    Future.delayed(Duration.zero, () {
      if (user != null) {
        _checkUserInDatabase(user.uid, context);
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage())); // User is not logged in
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your logo
            Image.asset(
              'assets/friends.png', // Make sure to replace with your logo path
              height: 100, // Adjust the height as needed
            ),
            SizedBox(height: 20), // Space between logo and loading indicator
            CircularProgressIndicator(), // Show loading indicator
          ],
        ),
      ),
    );
  }

  Future<void> _checkUserInDatabase(String uid, BuildContext context) async {
    // Reference to the Realtime Database
    DatabaseReference userRef = FirebaseDatabase.instance.ref('users/$uid');

    // Check if the user exists in the database
    userRef.once().then((DatabaseEvent event) {
      if (event.snapshot.exists) {
        // User exists in the database, navigate to home
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // User does not exist in the database, navigate to sign in page
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage()));
      }
    }).catchError((error) {
      // Handle any errors
      print('Error checking user in database: $error');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage()));
    });
  }
}