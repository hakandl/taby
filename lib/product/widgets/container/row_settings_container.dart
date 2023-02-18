import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:taby/feature/settings/viewmodel/settings_viewmodel.dart';

import '../buttons/fixed_size_elevated_button.dart';

class RowSettingsContainer extends StatelessWidget {
  RowSettingsContainer(
      {super.key, required this.text, required this.onPressedL, required this.onPressedR, this.center = true});
  final String text;
  final VoidCallback onPressedL;
  final VoidCallback onPressedR;
  bool center;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: context.normalBorderRadius,
        color: context.colorScheme.primary,
      ),
      padding: context.paddingNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: center ? centerText(context) : rightButtons(context),
      ),
    );
  }

  List<Widget> centerText(BuildContext context) {
    return [
      FixedSizeElevatedButton(
        elevation: 0,
        size: const Size(48, 48),
        onPressed: onPressedL,
        child: const Icon(Icons.remove),
      ),
      Text(
        text,
        style: context.textTheme.headline6,
      ),
      FixedSizeElevatedButton(
        elevation: 0,
        size: const Size(48, 48),
        onPressed: onPressedR,
        child: const Icon(Icons.add),
      )
    ];
  }

  List<Widget> rightButtons(BuildContext context) {
    return [
      Text(
        text,
        style: context.textTheme.headline6,
      ),
      const Spacer(),
      FixedSizeElevatedButton(
        elevation: 0,
        size: const Size(48, 48),
        onPressed: onPressedL,
        child: context.watch<SettingsViewModel>().isVibration
            ? const Icon(
                Icons.vibration,
              )
            : Image.asset(
                'assets/icon/vibrate_off.png',
                height: 24,
                width: 24,
                color: Colors.white,
              ),
      ),
      context.emptySizedWidthBoxLow3x,
      FixedSizeElevatedButton(
        elevation: 0,
        size: const Size(48, 48),
        onPressed: onPressedR,
        child: Icon(context.watch<SettingsViewModel>().isSound ? Icons.music_note : Icons.music_off),
      )
    ];
  }
}
