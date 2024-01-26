import 'dart:async';

import 'package:flutter/material.dart';
import 'package:job_post_app/screens/home_view.dart';
import 'package:job_post_app/screens/sign_up_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isLogedin = false;
  @override
  void initState() {
    super.initState();
    userCreation();
  }

  void userCreation() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.getString('name');
    sp.getString('email');
    sp.getString('password');
    isLogedin = sp.getBool('isLogin') ?? false;
    if (isLogedin) {
      Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeView()));
      });
    } else {
      Timer(const Duration(seconds: 5), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const SignUp()));
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "assets/jobPostSplash.jpg",
        fit: BoxFit.fill,
        height: double.infinity,
      ),
    );
  }
}
