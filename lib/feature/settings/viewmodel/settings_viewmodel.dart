import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel() {
    firstTeamTextField = TextEditingController()..text = firstTeamName;
    secondTeamTextField = TextEditingController()..text = secondTeamName;
    changeTeamName();
  }

  late TextEditingController firstTeamTextField;
  late TextEditingController secondTeamTextField;

  String firstTeamName = Hive.box('settings').get('first_team', defaultValue: 'Takım 1');
  String secondTeamName = Hive.box('settings').get('second_team', defaultValue: 'Takım 2');

  int score = Hive.box('settings').get('score', defaultValue: 20);
  int seconds = Hive.box('settings').get('seconds', defaultValue: 60);
  int skip = Hive.box('settings').get('skip', defaultValue: 3);

  void textFieldDispose() {
    firstTeamTextField.dispose();
    secondTeamTextField.dispose();
  }

  bool isVibration = Hive.box('settings').get('vibration', defaultValue: true);
  bool isSound = Hive.box('settings').get('sound', defaultValue: true);

  Future<void> hiveMethod(key, value) async {
    await Hive.box('settings').put(key, value);
  }

  Future<void> vibrationSettings() async {
    isVibration = !isVibration;
    await hiveMethod('vibration', isVibration);
    notifyListeners();
  }

  Future<void> soundSettings() async {
    isSound = !isSound;
    await hiveMethod('sound', isSound);
    notifyListeners();
  }

  Future<void> changeTeamName() async {
    await Hive.box('settings').put('first_team', firstTeamTextField.text);
    await Hive.box('settings').put('second_team', secondTeamTextField.text);

    if (firstTeamTextField.text.isEmpty) firstTeamTextField.text = 'Takım 1';
    if (secondTeamTextField.text.isEmpty) secondTeamTextField.text = 'Takım 2';
  }

  Future<void> upScore() async {
    score = score + 5;
    await hiveMethod('score', score);
    notifyListeners();
  }

  Future<void> downScore() async {
    if (score > 5) score = score - 5;
    await hiveMethod('score', score);
    notifyListeners();
  }

  Future<void> upSeconds() async {
    seconds = seconds + 10;
    await hiveMethod('seconds', seconds);
    notifyListeners();
  }

  Future<void> downSeconds() async {
    if (seconds > 10) seconds = seconds - 10;
    await hiveMethod('seconds', seconds);

    notifyListeners();
  }

  Future<void> upSkip() async {
    skip = skip + 1;
    await hiveMethod('skip', skip);
    notifyListeners();
  }

  Future<void> downSkip() async {
    if (skip > 0) skip = skip - 1;
    await hiveMethod('skip', skip);
    notifyListeners();
  }
}
