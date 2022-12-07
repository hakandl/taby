import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class GameStatusCard extends StatelessWidget {
  const GameStatusCard({super.key, required this.icon, this.title, this.text});
  final IconData icon;
  final String? title;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 128,
            color: context.colorScheme.onPrimary,
          ),
          title != null
              ? Text(
                  title ?? '',
                  style: context.textTheme.headline2,
                )
              : const SizedBox.shrink(),
          text != null
              ? Text(
                  text ?? '',
                  style: context.textTheme.headline6,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
