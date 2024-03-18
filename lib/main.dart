import 'package:flutter/material.dart';
import 'package:split_money/NavigationMenu.dart';
import 'package:split_money/SignInPage.dart';
import 'package:split_money/SlideSwitcher.dart';
import 'package:split_money/UserProfilePage.dart';
import 'package:split_money/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationMenu(),
    );
  }
}

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.white10.withOpacity(0.27),
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => NavigationMenu();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int switcherIndex1 = 0;
//   int switcherIndex2 = 0;
//   int switcherIndex3 = 0;
//   int switcherIndex4 = 0;
//   int switcherIndex5 = 0;
//   int switcherIndex6 = 0;
//   int switcherIndex7 = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: switcherIndex1 == 0
//           ? Colors.white10.withOpacity(0.27)
//           : Colors.white10.withOpacity(0.2),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
