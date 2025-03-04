part of '../pages/splash_screen.dart';

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lotties/netflix_splash.json',
      ),
    );
  }
}
