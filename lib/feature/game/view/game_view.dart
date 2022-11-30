import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:tabu/product/widgets/buttons/fixed_size_elevated_button.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: const Text('timer'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff138bfe),
        automaticallyImplyLeading: false,
      ), */
      backgroundColor: const Color(0xff4d2c91),
      body: SafeArea(
        child: Column(
          children: [
            context.emptySizedHeightBoxLow,
            Expanded(
              flex: 1,
              child: Padding(
                padding: context.horizontalPaddingLow,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Card(
                        color: const Color(0xff6439bd),
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
                        color: const Color(0xff6439bd),
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
                        color: const Color(0xff6439bd),
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
              flex: 8,
              child: PageView.builder(
                itemCount: 2,
                itemBuilder: (context, index) => Card(
                  margin: EdgeInsets.zero,
                  color: const Color(0xff6439bd),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'data',
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
                    backgroundColor: Colors.red,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  FixedSizeElevatedButton(
                    backgroundColor: Colors.orange,
                    child: const Icon(
                      Icons.cached_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  FixedSizeElevatedButton(
                    backgroundColor: Colors.green,
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
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
