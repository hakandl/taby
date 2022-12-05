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

  String firstTeamName = Hive.box('settings').get('firstTeam');
  String secondTeamName = Hive.box('settings').get('secondTeam');

  int score = Hive.box('settings').get('score', defaultValue: 20);
  int seconds = Hive.box('settings').get('seconds', defaultValue: 60);
  int skip = Hive.box('settings').get('skip', defaultValue: 3);

  void textFieldDispose() {
    firstTeamTextField.dispose();
    secondTeamTextField.dispose();
  }

  Future<void> changeTeamName() async {
    await Hive.box('settings').put('firstTeam', firstTeamTextField.text);
    await Hive.box('settings').put('secondTeam', secondTeamTextField.text);

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

  Future<void> hiveMethod(key, value) async {
    await Hive.box('settings').put(key, value);
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
