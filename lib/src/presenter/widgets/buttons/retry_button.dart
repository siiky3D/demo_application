import 'package:flutter/material.dart';

class RetryButton extends StatelessWidget {
  const RetryButton({required this.retryAction, required this.text, super.key});

  final void Function() retryAction;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Divider(),
        Expanded(
          child: Center(
            child: TextButton(
              onPressed: retryAction.call,
              child: const Text('Retry'),
            ),
          ),
        ),
      ],
    );
  }
}
