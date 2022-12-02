import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class TeamScoreCard extends StatelessWidget {
  const TeamScoreCard({super.key, required this.name, required this.score});
  final String name;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: context.textTheme.titleLarge,
          ),
          Text(
            score,
            style: context.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
