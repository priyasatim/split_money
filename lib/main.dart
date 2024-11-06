import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:split_money/bloc/internet_bloc/internet_bloc.dart';
import 'package:split_money/screens/NavigationMenu.dart';
import 'package:split_money/screens/SplashScreen.dart';
import 'package:split_money/repository/UserRepository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        title: 'Your App',
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          // Use a splash screen to check authentication
          '/home': (context) => NavigationMenu(),
          // Home screen after login
        },
      ),
    );;
  }
}
