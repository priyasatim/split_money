import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_money/bloc/internet_bloc/internet_bloc.dart';
import 'package:split_money/bloc/internet_bloc/internet_event.dart';
import 'package:split_money/bloc/internet_bloc/internet_state.dart';
import 'package:split_money/data/UserData.dart';
import 'package:split_money/repository/UserRepository.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SignInPage> {
  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      if (googleSignInAuthentication != null) {
        // final AuthCredential credential = GoogleAuthProvider.credential(
        //   accessToken: googleSignInAuthentication.accessToken,
        //   idToken: googleSignInAuthentication.idToken,
        // );

        // final UserCredential authResult =
        //     await FirebaseAuth.instance.signInWithCredential(credential);
        //
        // final User? user = authResult.user;
        //  await SharePreference.saveData(user?.displayName ?? "", user?.email ?? "");

        // final userData =
        //     UserData(name: user?.displayName ?? "", email: user?.email ?? "");
        // UserRepository.instance.createUser(userData);

        Navigator.pushNamed(context, "/home");

        // Now you have the authenticated user, you can handle the sign-in result
        // print('User signed in: ${user?.displayName}');
      }
    } catch (error) {
      // Handle sign-in errors
      print('Error signing in with Google: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          flexibleSpace: Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(top: 24.0, right: 24),
              child: Text(
                'Skip',
                style: GoogleFonts.roboto(
                    color: Color(0xFF8E24AA),
                    fontSize: 12,
                    fontFeatures: [
                      const FontFeature.enable('smcp'), // Enable small caps
                      const FontFeature.enable('frac'), // Enable fractions
                    ]),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(top: 74),
                    child: Container(
                      child: Column(children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Welcome',
                              style: GoogleFonts.roboto(
                                  color: const Color(0xFF696969),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFeatures: [
                                    const FontFeature.enable('smcp'),
                                    // Enable small caps
                                    const FontFeature.enable('frac'),
                                    // Enable fractions
                                  ]),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' Buddy',
                                    style: GoogleFonts.roboto(
                                        color: Color(0xFF8E24AA),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        fontFeatures: [
                                          const FontFeature.enable('smcp'),
                                          // Enable small caps
                                          const FontFeature.enable('frac'),
                                          // Enable fractions
                                        ]))
                              ]),
                        ),
                        SizedBox(height: 4),
                        Text(
                            '| Manage Group Expenses | Manage Personal Expenses',
                            style: GoogleFonts.roboto(
                                color: const Color(0xFF808080),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFeatures: [
                                  const FontFeature.enable('smcp'),
                                  // Enable small caps
                                  const FontFeature.enable('frac'),
                                  // Enable fractions
                                ]),
                            textAlign: TextAlign.center),
                        SizedBox(width: 8.0, height: 50),
                        Padding(
                          padding: const EdgeInsets.only(left: 28, right: 28),
                          child: Image.asset('assets/payrol.png'),
                        ),
                        const SizedBox(
                          height: 50,
                          width: 16.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 42, right: 42),
                          child: SizedBox(
                            width: double.infinity,
                            child: BlocBuilder<InternetBloc, InternetState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: () async {
                                    if(state is InternetGainState){
                                      _handleSignIn;
                                    }
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 44.0,
                                          top: 14,
                                          right: 44,
                                          bottom: 14),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              'assets/google.png',
                                              width: 16,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Continue with Google',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontFeatures: [
                                                    const FontFeature.enable(
                                                        'smcp'),
                                                    // Enable small caps
                                                    const FontFeature.enable(
                                                        'frac'),
                                                    // Enable fractions
                                                  ]),
                                            ),
                                          ])),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 25, width: 12),
                        Text(
                          "Need Help?",
                          style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: Colors.grey,
                              fontFeatures: [
                                const FontFeature.enable('smcp'),
                                // Enable small caps
                                const FontFeature.enable('frac'),
                                // Enable fractions
                              ]),
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.fiber_manual_record,
                                color: Color(0xFF8E24AA), size: 8),
                            SizedBox(width: 4),
                            Text(
                              "Privacy Policy?",
                              style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  color: Color(0xFF8E24AA),
                                  fontFeatures: [
                                    const FontFeature.enable('smcp'),
                                    // Enable small caps
                                    const FontFeature.enable('frac'),
                                    // Enable fractions
                                  ]),
                            ),
                            SizedBox(width: 12),
                            Icon(Icons.fiber_manual_record,
                                color: Color(0xFF8E24AA), size: 8),
                            SizedBox(width: 4),
                            Text(
                              "Terms & Condition",
                              style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  color: Color(0xFF8E24AA),
                                  fontFeatures: [
                                    const FontFeature.enable('smcp'),
                                    // Enable small caps
                                    const FontFeature.enable('frac'),
                                    // Enable fractions
                                  ]),
                            )
                          ],
                        ),
                        SizedBox(height: 25),
                      ]),
                    ))),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.transparent,
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Designed by heyrahul03',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'version - 1.0.1',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
