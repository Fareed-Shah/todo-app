import 'package:flutter/material.dart';
import 'package:job_post_app/screens/home_view.dart';
import 'package:job_post_app/screens/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
