import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:split_money/NavigationMenu.dart';
import 'package:split_money/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ?
  await Firebase.initializeApp
    (options: const FirebaseOptions(apiKey: 'AIzaSyA4D0RgJjVJhmXTb8t_fXxSoSVtEGd7BIc', appId: '1:604135319001:android:a8eaf9674985659161a5c8', messagingSenderId: '604135319001', projectId: 'flutter--signin-7d42f')) : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(), // Use a splash screen to check authentication
        '/home': (context) => NavigationMenu(), // Home screen after login
      },
    );;
  }
}
