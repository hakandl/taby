import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:tabu/feature/game/view/game_view.dart';

import '../../../product/widgets/buttons/container_elevated_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4d2c91),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                'TABU',
                style: context.textTheme.headline1?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff6439bd),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xff6439bd),
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
                          style: context.textTheme.headline4?.copyWith(color: Colors.white, letterSpacing: 10),
                        )),
                    context.emptySizedHeightBoxNormal,
                    ContainerElevatedButton(
                      onPressed: () {},
                      elevation: 10,
                      height: 44,
                      width: context.width / 2.5,
                      child: const Text('Ayarlar'),
                    ),
                    context.emptySizedHeightBoxLow3x,
                    ContainerElevatedButton(
                      onPressed: () {},
                      elevation: 10,
                      height: 44,
                      width: context.width / 2.5,
                      child: const Text('Kurallar'),
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
