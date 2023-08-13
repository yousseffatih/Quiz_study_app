import 'package:flutter/material.dart';

class AppCircleButton extends StatelessWidget {
  const AppCircleButton(
      {super.key,
      required this.child,
      this.color,
      this.width = 60,
      this.ontap});

  final Widget child;
  final Color? color;
  final double width;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      child: InkWell(
        onTap: ontap,
        child: child,
      ),
    );
  }
}
