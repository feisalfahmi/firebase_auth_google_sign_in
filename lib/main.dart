import 'package:firebase_auth_google_signin/Login/authservice.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_google_signin/Login/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: new MaterialApp(
        title: 'Firebase Auth Goofle Signin',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
