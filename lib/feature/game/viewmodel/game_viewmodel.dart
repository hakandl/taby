import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:tabu/core/base/viewmodel/base_viewmodel.dart';
import 'package:tabu/feature/home/view/home_view.dart';
import 'package:tabu/feature/settings/viewmodel/settings_viewmodel.dart';
import 'package:tabu/product/widgets/dialog/tabu_dialog.dart';
import 'package:provider/provider.dart';

class GameViewModel extends ChangeNotifier with BaseViewModel, TabuShowDialog {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    startTimer();
  }

  /* void disposeTimer() {
    stopTimer();
  } */

  PageController pageController = PageController();

  Timer? timer;
  late int remainingTime = context!.read<SettingsViewModel>().seconds;

  late int skipCount = context!.read<SettingsViewModel>().skip;

  bool firstTeam = true;
  int firstTeamScore = 0;
  int secondTeamScore = 0;

  void startTimer() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        timer = Timer.periodic(
          const Duration(seconds: 1),
          (_) {
            if (remainingTime > 0) {
              remainingTime--;
              notifyListeners();
            } else if (firstTeamScore >= context!.read<SettingsViewModel>().score ||
                secondTeamScore >= context!.read<SettingsViewModel>().score) {
              stopTimer();
              nextResultView();
            } else {
              stopTimer();
              showTabuShowDialog(
                context!,
                onPressed: () => teamChange(),
              );
            }
          },
        );
      },
    );
  }

  void resetTimer() {
    remainingTime = context!.read<SettingsViewModel>().seconds;

    // düzenlenecek
    context!.read<SettingsViewModel>().skip = 5;
    print(context!.read<SettingsViewModel>().skip);
    startTimer();
    notifyListeners();
  }

  void stopTimer() {
    timer?.cancel();
  }

  void addScore() {
    firstTeam ? firstTeamScore++ : secondTeamScore++;
    print(context!.read<SettingsViewModel>().skip);
    pageController.jumpToPage(pageController.page!.toInt() + 1);
    notifyListeners();
  }

  void removeScore() {
    if (firstTeamScore > 0) firstTeam ? firstTeamScore-- : null;
    if (secondTeamScore > 0) firstTeam ? null : secondTeamScore--;
    pageController.jumpToPage(pageController.page!.toInt() + 1);
    notifyListeners();
  }

  void pass() {
    if (context!.read<SettingsViewModel>().skip != 0) {
      pageController.jumpToPage(pageController.page!.toInt() + 1);
      context!.read<SettingsViewModel>().downSkip();
      notifyListeners();
    }
  }

  void teamChange() {
    firstTeam = !firstTeam;

    resetTimer();
    context?.pop();
  }

  void nextResultView() {
    context?.navigateToPage(const HomeView());
  }
}
