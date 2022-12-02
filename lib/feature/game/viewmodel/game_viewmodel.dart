import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:tabu/core/base/viewmodel/base_viewmodel.dart';
import 'package:tabu/product/widgets/dialog/tabu_dialog.dart';

class GameViewModel extends ChangeNotifier with BaseViewModel, TabuShowDialog {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    startTimer();
  }

  PageController pageController = PageController();

  Timer? timers;
  int time = 5;
  late int remainingTime = time;

  bool firstTeam = true;
  int firstTeamScore = 0;
  int secondTeamScore = 0;

  void startTimer() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        timers = Timer.periodic(
          const Duration(seconds: 1),
          (_) {
            if (remainingTime > 0) {
              remainingTime--;
              notifyListeners();
            } else if (firstTeamScore >= 20 || secondTeamScore >= 20) {
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
    remainingTime = time;
    startTimer();
    notifyListeners();
  }

  void stopTimer() {
    timers?.cancel();
  }

  void addScore() {
    firstTeam ? firstTeamScore++ : secondTeamScore++;
    pageController.jumpToPage(pageController.page!.toInt() + 1);
    notifyListeners();
  }

  void removeScore() {
    firstTeam ? firstTeamScore-- : secondTeamScore--;
    pageController.jumpToPage(pageController.page!.toInt() + 1);
    notifyListeners();
  }

  void pass() {
    pageController.jumpToPage(pageController.page!.toInt() + 1);
    notifyListeners();
  }

  void teamChange() {
    firstTeam = !firstTeam;
    resetTimer();
    context?.pop();
  }

  void nextResultView() {}
}
