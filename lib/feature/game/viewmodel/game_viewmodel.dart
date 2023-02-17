import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

import '../../../core/base/viewmodel/base_viewmodel.dart';
import '../../home/view/home_view.dart';
import '../../settings/viewmodel/settings_viewmodel.dart';
import '../model/game_model.dart';

class GameViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    startTimer();
    getWords();
  }

  Timer? timer;
  PageController pageController = PageController();
  final player = AudioPlayer();

  late int remainingTime = context!.read<SettingsViewModel>().seconds;
  late int skipCount = context!.read<SettingsViewModel>().skip;

  bool firstTeam = true;
  int firstTeamScore = 0;
  int secondTeamScore = 0;

  List<GameModel> wordsList = [];

  Future<void> getWords() async {
    final response = await rootBundle.loadString('assets/data/words.json');
    final jsonResponse = await jsonDecode(response) as List;
    // final jsonResponse = await compute(jsonDecode, response) as List;
    wordsList = jsonResponse.map((e) => GameModel.fromJson(e)).toList()..shuffle();
  }

  void startTimer() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        timer = Timer.periodic(
          const Duration(seconds: 1),
          (_) {
            if (remainingTime <= 4 && remainingTime > 0) {
              if (context!.read<SettingsViewModel>().isVibration) {
                Vibration.vibrate();
              }
            }
            if (remainingTime > 0) {
              remainingTime--;
              notifyListeners();
            } else if (firstTeamScore >= context!.read<SettingsViewModel>().score ||
                secondTeamScore >= context!.read<SettingsViewModel>().score) {
              stopTimer();
              // nextResultView();
            } else {
              stopTimer();
              // reset();
            }
          },
        );
        notifyListeners();
      },
    );
  }

  void reset() {
    firstTeam = !firstTeam;
    remainingTime = context!.read<SettingsViewModel>().seconds;
    skipCount = context!.read<SettingsViewModel>().skip;
    // context?.pop();
    wordsList.shuffle();
    pageController.jumpToPage(0);
    startTimer();
    // notifyListeners();
  }

  void stopTimer() {
    timer?.cancel();
    notifyListeners();
    if (context!.read<SettingsViewModel>().isVibration) {
      Vibration.vibrate(duration: 1000);
    }
  }

  void addScore() {
    player.play(AssetSource('data/sound/correct.wav'));
    firstTeam ? firstTeamScore++ : secondTeamScore++;
    pageController.jumpToPage(pageController.page!.toInt() + 1);

    notifyListeners();
  }

  void removeScore() {
    player.play(AssetSource('data/sound/wrong.wav'));
    if (firstTeamScore > 0) firstTeam ? firstTeamScore-- : null;
    if (secondTeamScore > 0) firstTeam ? null : secondTeamScore--;
    pageController.jumpToPage(pageController.page!.toInt() + 1);
    notifyListeners();
  }

  void skip() {
    if (context!.read<SettingsViewModel>().skip != 0) {
      pageController.jumpToPage(pageController.page!.toInt() + 1);
      skipCount--;
      notifyListeners();
    }
  }

  void nextResultView() {
    context?.navigateToPage(const HomeView());
  }
}
