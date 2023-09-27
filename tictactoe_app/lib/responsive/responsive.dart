import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget child;
  const Responsive({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      /* This ConstrainedBox restrict the dimensions of a child widget
      to prevent it from growing too large or shrinking too small */

      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 600,
        ),
        child: child,
      ),
    );
  }
}
