import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:tabu/feature/game/viewmodel/game_viewmodel.dart';
import 'package:tabu/product/widgets/buttons/fixed_size_elevated_button.dart';
import 'package:tabu/product/widgets/cards/team_score_card.dart';

import '../../../core/base/view/base_view.dart';
import '../../../product/widgets/cards/timer_card.dart';
import '../../settings/viewmodel/settings_viewmodel.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<GameViewModel>(
      viewModel: GameViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onDispose: (model) {
        model.stopTimer();
      },
      onPageBuilder: (context, value) => ChangeNotifierProvider(
        create: (context) => value,
        builder: (context, child) => Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                context.emptySizedHeightBoxLow,
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: context.horizontalPaddingLow,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: TeamScoreCard(
                                name: context.watch<SettingsViewModel>().firstTeamTextField.text,
                                score: context.watch<GameViewModel>().firstTeamScore.toString())),
                        Expanded(flex: 2, child: TimerCard(timer: context.watch<GameViewModel>().remainingTime)),
                        Expanded(
                            flex: 4,
                            child: TeamScoreCard(
                                name: context.watch<SettingsViewModel>().secondTeamTextField.text,
                                score: context.watch<GameViewModel>().secondTeamScore.toString())),
                      ],
                    ),
                  ),
                ),
                context.emptySizedHeightBoxLow,
                Expanded(
                  flex: 11,
                  child: PageView.builder(
                    controller: value.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 20,
                    itemBuilder: (context, index) => Card(
                      margin: EdgeInsets.zero,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'data $index',
                            style: context.textTheme.headline2,
                          ),
                          Divider(
                            thickness: 3,
                            endIndent: context.width / 6,
                            indent: context.width / 6,
                          ),
                          Text('data', style: context.textTheme.headline4),
                          Text('data', style: context.textTheme.headline4),
                          Text('data', style: context.textTheme.headline4),
                          Text('data', style: context.textTheme.headline4),
                          Text('data', style: context.textTheme.headline4),
                        ],
                      ),
                    ),
                  ),
                ),
                // context.emptySizedHeightBoxLow3x,
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FixedSizeElevatedButton(
                        backgroundColor: context.colorScheme.error,
                        child: const Icon(
                          Icons.close,
                        ),
                        onPressed: () => value.removeScore(),
                      ),
                      FixedSizeElevatedButton(
                        backgroundColor: context.colorScheme.background,
                        onPressed: context.read<SettingsViewModel>().skip == 0 ? null : () => value.pass(),
                        child: const Icon(
                          Icons.cached_rounded,
                        ),
                      ),
                      FixedSizeElevatedButton(
                        backgroundColor: context.colorScheme.onBackground,
                        child: const Icon(
                          Icons.check,
                        ),
                        onPressed: () => value.addScore(),
                      ),
                    ],
                  ),
                ),
                // context.emptySizedHeightBoxLow3x,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
