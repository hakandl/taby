import 'package:flutter/material.dart';
import 'package:tabu/core/constants/app/app_constants.dart';
import 'package:tabu/feature/home/view/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const HomeView(),
      theme: ThemeData(fontFamily: ApplicationConstants.FONT_FAMILY),
    );
  }
}
