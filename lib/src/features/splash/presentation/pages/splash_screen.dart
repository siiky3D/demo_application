import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/src/core/config/routes/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      context.goNamed(AppRoute.login.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/lotties/netflix_splash.json'),
    );
  }
}
