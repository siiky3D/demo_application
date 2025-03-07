import 'package:flutter/material.dart';

class KeyboardDismisser extends StatelessWidget {
  const KeyboardDismisser({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
