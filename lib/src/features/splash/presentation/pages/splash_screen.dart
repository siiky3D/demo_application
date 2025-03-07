import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/gen/assets.gen.dart';
import 'package:netflix_clone/src/core/config/routes/app_router.dart';
import 'package:netflix_clone/src/features/auth/domain/repositories/auth/authentication_repository.dart';
import 'package:netflix_clone/src/features/auth/presentation/states/auth/authentication_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        switch (state.status) {
          case AuthenticationStatus.unauthenticated:
            context.goNamed(AppRoute.login.name);
          case AuthenticationStatus.authenticated:
            context.goNamed(AppRoute.profileSelection.name);
          case AuthenticationStatus.unknown:
            break;
        }
      },
      child: Scaffold(
        body: Center(child: Lottie.asset(Assets.lotties.netflixSplash)),
      ),
    );
  }
}
