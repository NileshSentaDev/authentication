import 'dart:async';
import 'package:authentication/ui/post_screen/post_screen.dart';
import 'package:authentication/ui/authentication/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final firebaseAuth = FirebaseAuth.instance;
  final currentUser =  FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    if(currentUser != null){
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PostScreen(),
            ));
      });
    }else{
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome Senta'),
      ),
    );
  }
}
