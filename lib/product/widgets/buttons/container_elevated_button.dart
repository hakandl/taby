import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ContainerElevatedButton extends StatelessWidget {
  const ContainerElevatedButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.backgroundColor,
      this.width,
      this.height,
      this.elevation});
  final Widget child;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double? width;

  final double? height;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? context.colorScheme.secondary,
        elevation: elevation ?? 20,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: context.colorScheme.primary),
          borderRadius: context.lowBorderRadius,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        width: width ?? context.width / 2,
        height: height ?? 64,
        child: child,
      ),
    );
  }
}
