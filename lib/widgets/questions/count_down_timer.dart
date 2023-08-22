import 'package:flutter/material.dart';

import '../../configs/themes/custul_text_style.dart';

class CountDownTimer extends StatelessWidget {
  const CountDownTimer({
    super.key,
    this.color,
    this.time,
  });
  final Color? color;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: color ?? Theme.of(context).primaryColor,
        ),
        const SizedBox(width: 5),
        Text(
          time!,
          style: countDownText().copyWith(color: color),
        )
      ],
    );
  }
}
