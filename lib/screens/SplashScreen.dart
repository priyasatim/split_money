import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:split_money/screens/NavigationMenu.dart';
import 'package:split_money/screens/SignInPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:split_money/repository/UserRepository.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    // Firebase is initialized
    if (Platform.isAndroid) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyA4D0RgJjVJhmXTb8t_fXxSoSVtEGd7BIc',
          appId: '1:604135319001:android:a8eaf9674985659161a5c8',
          messagingSenderId: '604135319001',
          projectId: 'flutter--signin-7d42f',
        ),
      );

      // Register your UserRepository or other controllers
      Get.put(UserRepository()); // Register the UserRepository globally
    } else {
      await Firebase.initializeApp();
      // Register your UserRepository or other controllers
      Get.put(UserRepository()); // Register the UserRepository globally
    }

      bool isLoggedIn = await checkLoginState();
      print('isLoggedIn: ${isLoggedIn}');

      // Navigate based on whether the user is logged in
      if (isLoggedIn) {
        // User is logged in, navigate to the home page (NavigationMenu)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NavigationMenu(), // User is logged in, navigate to home
          ),
        );
      } else {
        // User is not logged in, navigate to the sign-in page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SignInPage(), // User is not logged in, navigate to login
          ),
        );
      }

  }

  @override
  Widget build(BuildContext context) {
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

  Future<bool> checkLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');  // Get email from SharedPreferences

    print("Email from SharedPreferences: $email");

    if (email == null) {
      return false;
    } else {
      // Query Firestore to check if 'isLogin' is true for this email
      CollectionReference users = FirebaseFirestore.instance.collection('Users');
      QuerySnapshot querySnapshot = await users.where('email', isEqualTo: email).get();

      if (querySnapshot.docs.isNotEmpty) {
        // Get the first matching document
        DocumentSnapshot userSnapshot = querySnapshot.docs.first;

        print("Firestore isLogin value: ${userSnapshot['isLogin']}");

        return userSnapshot['isLogin'] ?? false;
      } else {
        return false;
      }
    }
  }
}