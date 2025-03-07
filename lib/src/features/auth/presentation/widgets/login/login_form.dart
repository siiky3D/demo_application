import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:netflix_clone/gen/assets.gen.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/l10n/l10n.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/features/auth/presentation/states/login/login_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(locale.authError)),
            );
        }
      },
      child: Align(
        alignment: Alignment.center + const Alignment(0, 1.2 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _UsernameInput(),
            gapH16,
            _PasswordInput(),
            gapH40,
            _LoginButton(),
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        key: const Key('loginForm_usernameInput_textField'),
        onChanged: (username) {
          context.read<LoginBloc>().add(LoginUsernameChanged(username));
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16).w,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          fillColor: context.colors.secondary,
          hintText: locale.username,
          hintStyle: context.typographies.bodyLarge.copyWith(
            color: context.colors.textOnPrimary.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).w,
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        key: const Key('loginForm_passwordInput_textField'),
        onChanged: (password) {
          context.read<LoginBloc>().add(LoginPasswordChanged(password));
        },
        obscureText: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          fillColor: context.colors.secondary,
          hintText: locale.password,
          hintStyle: context.typographies.bodyLarge.copyWith(
            color: context.colors.textOnPrimary.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (LoginBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    final isValid = context.select((LoginBloc bloc) => bloc.state.isValid);

    return IconButton(
      onPressed: isValid
          ? () => context.read<LoginBloc>().add(const LoginSubmitted())
          : null,
      icon: isInProgressOrSuccess
          ? const CircularProgressIndicator()
          : Assets.images.loginIcon.image(
              width: MediaQuery.of(context).size.width * 0.18,
            ),
    );
  }
}
