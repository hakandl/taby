import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class FixedSizeElevatedButton extends StatelessWidget {
  const FixedSizeElevatedButton(
      {super.key, required this.child, required this.onPressed, this.backgroundColor, this.size, this.elevation});
  final Widget child;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Size? size;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 20,
          foregroundColor: context.colorScheme.onPrimary,
          backgroundColor: backgroundColor,
          fixedSize: size ?? const Size(96, 64),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 2, color: context.colorScheme.onPrimary),
            borderRadius: context.lowBorderRadius,
          ),
        ),
        child: child);
  }
}
