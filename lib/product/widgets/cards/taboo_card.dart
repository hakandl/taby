import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class TabooCard extends StatelessWidget {
  const TabooCard({super.key, required this.word, required this.taboo});
  final String word;
  final String taboo;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        padding: context.horizontalPaddingNormal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              word.toUpperCase(),
              style: context.textTheme.headline2,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
            Divider(
              thickness: 3,
              endIndent: context.width / 6,
              indent: context.width / 6,
            ),
            AutoSizeText(
              taboo.replaceAll(',', '\n').toTitleCase(),
              style: context.textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
