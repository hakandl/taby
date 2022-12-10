import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:tabu/feature/game/viewmodel/game_viewmodel.dart';
import 'package:tabu/product/widgets/buttons/fixed_size_elevated_button.dart';
import 'package:tabu/product/widgets/cards/team_score_card.dart';

import '../../../core/base/view/base_view.dart';
import '../../../product/widgets/cards/game_status_card.dart';
import '../../../product/widgets/cards/timer_card.dart';
import '../../home/view/home_view.dart';
import '../../settings/viewmodel/settings_viewmodel.dart';

part '../module/widgets/bottom_buttons.dart';

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
                              score: context.watch<GameViewModel>().firstTeamScore.toString()),
                        ),
                        Expanded(
                            flex: 2,
                            child: TimerCard(
                                onTap: () => context.read<GameViewModel>().stopTimer(),
                                timer: context.watch<GameViewModel>().remainingTime)),
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
                      itemCount: value.wordsList.length,
                      itemBuilder: (context, index) {
                        if (context.watch<GameViewModel>().timer != null &&
                            !context.watch<GameViewModel>().timer!.isActive) {
                          if (value.remainingTime == 0 &&
                                  value.firstTeamScore >= context.read<SettingsViewModel>().score ||
                              value.secondTeamScore >= context.read<SettingsViewModel>().score) {
                            return GameStatusCard(
                              icon: Icons.thumb_up_outlined,
                              text:
                                  'Oyun bitti, kazanan ${value.firstTeamScore > value.secondTeamScore ? context.watch<SettingsViewModel>().firstTeamTextField.text : context.watch<SettingsViewModel>().secondTeamTextField.text} oldu',
                            );
                          } else if (context.watch<GameViewModel>().remainingTime == 0) {
                            return const GameStatusCard(
                              icon: Icons.timer_outlined,
                              title: 'Süre doldu',
                              text: 'Telefonu diğer takıma verin',
                            );
                          } else {
                            return const GameStatusCard(icon: Icons.pause);
                          }
                        }
                        return Card(
                          margin: EdgeInsets.zero,
                          child: Container(
                            padding: context.horizontalPaddingNormal,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  value.wordsList[index].word!.toUpperCase(),
                                  style: context.textTheme.headline2,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                ),
                                Divider(
                                  thickness: 3,
                                  endIndent: context.width / 6,
                                  indent: context.width / 6,
                                ),
                                AutoSizeText(
                                  '${value.wordsList[index].taboo?.replaceAll(',', '\n').toTitleCase()}',
                                  style: context.textTheme.headline4,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Expanded(
                  flex: 2,
                  child: BottomButtons(
                    value: value,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
