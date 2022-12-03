import 'package:flutter/material.dart';

class SettingsViewModel extends ChangeNotifier {
  TextEditingController firstTeamTextField = TextEditingController();
  TextEditingController secondTeamTextField = TextEditingController();

  String firstTeamName = 'Takım 1';
  String secondTeamName = 'Takım 2';

  int score = 10;
  int seconds = 90;
  int pass = 3;

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

  void upPass() {
    pass = pass + 1;
    notifyListeners();
  }

  void downPass() {
    if (pass > 0) pass = pass - 1;
    notifyListeners();
  }
}
