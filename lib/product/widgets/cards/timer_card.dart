import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key, required this.timer});
  final int timer;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        height: context.height,
        child: Text(
          timer.toString(),
          style: context.textTheme.titleLarge,
        ),
      ),
    );
  }
}
