import 'package:flutter/material.dart';

class SettingsViewModel extends ChangeNotifier {
  late TextEditingController firstTeamTextField;
  late TextEditingController secondTeamTextField;

  String firstTeamName = 'Takım 1';
  String secondTeamName = 'Takım 2';

  SettingsViewModel() {
    firstTeamTextField = TextEditingController();
    secondTeamTextField = TextEditingController();
    firstTeamTextField.text = firstTeamName;
    secondTeamTextField.text = secondTeamName;
  }

  void textFieldDispose() {
    firstTeamTextField.dispose();
    secondTeamTextField.dispose();
  }

  int score = 10;
  int seconds = 5;
  int skip = 3;

  void upScore() {
    score = score + 5;
    notifyListeners();
  }

  void downScore() {
    if (score > 5) score = score - 5;
    notifyListeners();
  }

  void upSeconds() {
    seconds = seconds + 10;
    notifyListeners();
  }

  void downSeconds() {
    if (seconds > 30) seconds = seconds - 10;
    notifyListeners();
  }

  void upSkip() {
    skip = skip + 1;
    notifyListeners();
  }

  void downSkip() {
    if (skip > 0) skip = skip - 1;
    notifyListeners();
  }
}
