import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_clone/src/core/config/routes/app_router.dart';

class ProfileSelectionScreen extends StatelessWidget {
  const ProfileSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              child: const Text(
                'Profile Selection Screen ',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () => context.goNamed(AppRoute.home.name),
            ),
          ),
        ],
      ),
    );
  }
}
