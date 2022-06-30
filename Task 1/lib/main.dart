import 'package:flutter/material.dart';
import 'package:untitled/onBoard_page.dart';
import 'package:untitled/signIn_page.dart';
import 'package:untitled/signUp_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'signin': (context) => const SignInPage(),
        'register': (context) => const SignUpPage(),
        'onboard': (context) => const OnBoardingScreen()
      },
      home: const OnBoardingScreen(),
    );
  }
}
