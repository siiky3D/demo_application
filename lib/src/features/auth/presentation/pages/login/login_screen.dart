import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/gen/assets.gen.dart';
import 'package:netflix_clone/injector.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/features/auth/presentation/states/login/login_bloc.dart';
import 'package:netflix_clone/src/features/auth/presentation/widgets/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundDark,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.images.netflixRibbon.path),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height * 0.1,
            left: 0,
            right: 0,
            child: Center(
              child: Assets.images.netflixLogo.image(
                fit: BoxFit.cover,
                height: MediaQuery.sizeOf(context).height * 0.15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: BlocProvider<LoginBloc>(
              create: (context) => injector<LoginBloc>(),
              child: const LoginForm(),
            ),
          ),
        ],
      ),
    );
  }
}
