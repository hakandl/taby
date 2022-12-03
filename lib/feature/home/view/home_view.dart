import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:tabu/feature/game/view/game_view.dart';

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
                'TABU',
                style: context.textTheme.headline1?.copyWith(
                  fontWeight: FontWeight.w300,
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
                    context.emptySizedHeightBoxLow3x,
                    ContainerElevatedButton(
                      onPressed: () {},
                      elevation: 10,
                      height: 44,
                      width: context.width / 2.5,
                      child: Text('Kurallar', style: context.textTheme.titleMedium),
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
