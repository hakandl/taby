import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taby/feature/game/viewmodel/game_viewmodel.dart';
import 'package:taby/feature/settings/viewmodel/settings_viewmodel.dart';
import 'package:taby/product/widgets/cards/game_status_card.dart';

class GameEndView extends StatefulWidget {
  const GameEndView({super.key});

  @override
  State<GameEndView> createState() => _GameEndViewState();
}

class _GameEndViewState extends State<GameEndView> {
  @override
  void initState() {
    super.initState();
    adsLoading();
  }

  void adsLoading() async {
    context.read<GameViewModel>().isAdLoading = true;
    Future.delayed(const Duration(seconds: 1)).then((value) {
      context.read<GameViewModel>().showInterstitialAd();
      context.read<GameViewModel>().isAdLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return context.watch<GameViewModel>().isAdLoading == true
        ? const Center(child: CircularProgressIndicator())
        : GameStatusCard(
            icon: Icons.celebration_outlined,
            text:
                'Oyun bitti, kazanan ${context.watch<GameViewModel>().firstTeamScore > context.watch<GameViewModel>().secondTeamScore ? context.watch<SettingsViewModel>().firstTeamTextField.text : context.watch<SettingsViewModel>().secondTeamTextField.text} oldu',
          );
  }
}
