import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:taby/feature/game/view/game_view.dart';
import 'package:video_player/video_player.dart';

import '../../../product/widgets/buttons/container_elevated_button.dart';
import '../../settings/view/settings_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/data/video/bg_video.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: .2,
            child: SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
          ),
          Center(
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
        ],
      ),
    );
  }
}
