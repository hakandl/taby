import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:taby/feature/game/view/game_view.dart';

import '../../../product/widgets/buttons/container_elevated_button.dart';
import '../../settings/view/settings_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                'taby',
                style: context.textTheme.headline1?.copyWith(
                  fontFamily: 'Merienda',
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  boxShadow: [
                    BoxShadow(
                      color: context.colorScheme.primary,
                      spreadRadius: 10,
                      blurRadius: 20,
                    ),
                  ],
                  borderRadius: context.normalBorderRadius,
                ),
                padding: context.paddingMedium,
                child: Column(
                  children: [
                    ContainerElevatedButton(
                      onPressed: () {
                        context.navigateToPage(const GameView());
                      },
                      child: Text(
                        'OYNA',
                        style: context.textTheme.headline4?.copyWith(letterSpacing: 10, fontWeight: FontWeight.w500),
                      ),
                    ),
                    context.emptySizedHeightBoxNormal,
                    ContainerElevatedButton(
                      onPressed: () => context.navigateToPage(const SettingsView()),
                      elevation: 10,
                      height: 44,
                      width: context.width / 2.5,
                      child: Text('Ayarlar', style: context.textTheme.titleMedium),
                    ),
                    context.emptySizedHeightBoxLow,
                    ContainerElevatedButton(
                      onPressed: () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                      elevation: 10,
                      height: 44,
                      width: context.width / 2.5,
                      child: Text('Çıkış', style: context.textTheme.titleMedium),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
