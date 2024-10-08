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

    print('Email_user: $user.email');
    print('uid_user: $user.uid');

    // If user is logged in, navigate to home, else to sign in page
    Future.delayed(Duration.zero, () {
      // if (user != null) {
      //   checkIfEmailExists(user.email!.trim());
      // } else {
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => SignInPage())); // User is not logged in
      // }
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

  // void checkIfEmailExists(String email) async {
  //   print("Checking email:$email");
  //   try {
  //     final user = await FirebaseAuth.instance.getUserByEmail(email);
  //     if (user != null) {
  //       print('Email exists!');
  //     } else {
  //       print('Email does not exist!');
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     print("FirebaseAuthException: ${e.code}"); // Added log
  //     if (e.code == 'invalid-email') {
  //       print('The email address is badly formatted.');
  //     } else if (e.code == 'user-not-found') {
  //       print('No user found for this email.');
  //     } else {
  //       print('An error occurred: ${e.message}');
  //     }
  //   } catch (error) {
  //     print("An unexpected error occurred: $error");
  //   }
  // }
  Future<bool> isEmailAuthorized(String email) async {
    try {
      final signInMethods =  await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return signInMethods.isNotEmpty;
    } catch (e) {
      print('Error checking email authorization: $e');
      return false;
    }
  }

}