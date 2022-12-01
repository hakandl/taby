import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:tabu/product/widgets/buttons/fixed_size_elevated_button.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            context.emptySizedHeightBoxLow,
            Expanded(
              flex: 2,
              child: Padding(
                padding: context.horizontalPaddingLow,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Takım 1',
                              style: context.textTheme.titleLarge,
                            ),
                            Text(
                              '0',
                              style: context.textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Card(
                        child: Container(
                          alignment: Alignment.center,
                          height: context.height,
                          child: Text(
                            '0',
                            style: context.textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Takım 2',
                              style: context.textTheme.titleLarge,
                            ),
                            Text(
                              '0',
                              style: context.textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            context.emptySizedHeightBoxLow,
            Expanded(
              flex: 11,
              child: PageView.builder(
                itemCount: 20,
                itemBuilder: (context, index) => Card(
                  margin: EdgeInsets.zero,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'data $index',
                        style: context.textTheme.headline2,
                      ),
                      Divider(
                        thickness: 3,
                        endIndent: context.width / 6,
                        indent: context.width / 6,
                      ),
                      Text('data', style: context.textTheme.headline4),
                      Text('data', style: context.textTheme.headline4),
                      Text('data', style: context.textTheme.headline4),
                      Text('data', style: context.textTheme.headline4),
                      Text('data', style: context.textTheme.headline4),
                    ],
                  ),
                ),
              ),
            ),
            // context.emptySizedHeightBoxLow3x,
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FixedSizeElevatedButton(
                    backgroundColor: context.colorScheme.error,
                    child: const Icon(
                      Icons.close,
                    ),
                    onPressed: () {},
                  ),
                  FixedSizeElevatedButton(
                    backgroundColor: context.colorScheme.background,
                    child: const Icon(
                      Icons.cached_rounded,
                    ),
                    onPressed: () {},
                  ),
                  FixedSizeElevatedButton(
                    backgroundColor: context.colorScheme.onBackground,
                    child: const Icon(
                      Icons.check,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // context.emptySizedHeightBoxLow3x,
          ],
        ),
      ),
    );
  }
}
