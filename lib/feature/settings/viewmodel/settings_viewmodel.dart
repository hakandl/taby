import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taby/product/constants/string_constants.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel() {
    firstTeamTextField = TextEditingController()..text = firstTeamName;
    secondTeamTextField = TextEditingController()..text = secondTeamName;
    changeTeamName();
  }

  late TextEditingController firstTeamTextField;
  late TextEditingController secondTeamTextField;

  String firstTeamName = Hive.box(
    TabyStringConstants.hiveSettings,
  ).get(
    TabyStringConstants.hiveFirstTeam,
    defaultValue: TabyStringConstants.defaultFirstTeamName,
  );
  String secondTeamName = Hive.box(TabyStringConstants.hiveSettings).get(
    TabyStringConstants.hiveSecondTeam,
    defaultValue: TabyStringConstants.defaultSecondTeamName,
  );

  int score = Hive.box(TabyStringConstants.hiveSettings).get(
    TabyStringConstants.hiveScore,
    defaultValue: 20,
  );
  int seconds = Hive.box(TabyStringConstants.hiveSettings).get(
    TabyStringConstants.hiveSeconds,
    defaultValue: 90,
  );
  int skip = Hive.box(TabyStringConstants.hiveSettings).get(
    TabyStringConstants.hiveSkip,
    defaultValue: 3,
  );

  void textFieldDispose() {
    firstTeamTextField.dispose();
    secondTeamTextField.dispose();
  }

  bool isVibration = Hive.box(TabyStringConstants.hiveSettings).get(
    TabyStringConstants.hiveVibration,
    defaultValue: true,
  );
  bool isSound = Hive.box(TabyStringConstants.hiveSettings).get(
    TabyStringConstants.hiveSound,
    defaultValue: true,
  );

  Future<void> hiveMethod(key, value) async {
    await Hive.box(TabyStringConstants.hiveSettings).put(key, value);
  }

  Future<void> vibrationSettings() async {
    isVibration = !isVibration;
    await hiveMethod(TabyStringConstants.hiveVibration, isVibration);
    notifyListeners();
  }

  Future<void> soundSettings() async {
    isSound = !isSound;
    await hiveMethod(TabyStringConstants.hiveSound, isSound);
    notifyListeners();
  }

  Future<void> changeTeamName() async {
    await Hive.box(TabyStringConstants.hiveSettings).put(
      TabyStringConstants.hiveFirstTeam,
      firstTeamTextField.text,
    );
    await Hive.box(TabyStringConstants.hiveSettings).put(
      TabyStringConstants.hiveSecondTeam,
      secondTeamTextField.text,
    );

    if (firstTeamTextField.text.isEmpty) firstTeamTextField.text = TabyStringConstants.defaultFirstTeamName;
    if (secondTeamTextField.text.isEmpty) secondTeamTextField.text = TabyStringConstants.defaultSecondTeamName;
  }

  Future<void> upScore() async {
    score = score + 5;
    await hiveMethod(TabyStringConstants.hiveScore, score);
    notifyListeners();
  }

  Future<void> downScore() async {
    if (score > 5) score = score - 5;
    await hiveMethod(TabyStringConstants.hiveScore, score);
    notifyListeners();
  }

  Future<void> upSeconds() async {
    seconds = seconds + 10;
    await hiveMethod(TabyStringConstants.hiveSeconds, seconds);
    notifyListeners();
  }

  Future<void> downSeconds() async {
    if (seconds > 10) seconds = seconds - 10;
    await hiveMethod(TabyStringConstants.hiveSeconds, seconds);

    notifyListeners();
  }

  Future<void> upSkip() async {
    skip = skip + 1;
    await hiveMethod(TabyStringConstants.hiveSkip, skip);
    notifyListeners();
  }

  Future<void> downSkip() async {
    if (skip > 0) skip = skip - 1;
    await hiveMethod(TabyStringConstants.hiveSkip, skip);
    notifyListeners();
  }
}
