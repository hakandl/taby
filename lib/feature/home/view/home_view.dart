import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff4d2c91),
      // backgroundColor: const Color(0xff2596be),
      backgroundColor: const Color(0xff138bfe),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                'TABU',
                style: context.textTheme.headline1?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff138bfe),
                    elevation: 20,
                    // shadowColor: Colors.white24,
                    shape: RoundedRectangleBorder(
                      // side: const BorderSide(width: 1, color: Colors.white),
                      borderRadius: context.lowBorderRadius,
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 2,
                    height: 64,
                    child: Text(
                      'OYNA',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.white,
                            letterSpacing: 10,
                          ),
                    ),
                  )),
              context.emptySizedHeightBoxNormal,
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff138bfe),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    // side: const BorderSide(width: 2, color: Colors.white),
                    borderRadius: context.lowBorderRadius,
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 44,
                  child: const Text('Ayarlar'),
                ),
              ),
              context.emptySizedHeightBoxLow3x,
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff138bfe),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    // side: const BorderSide(width: 2, color: Colors.white),
                    borderRadius: context.lowBorderRadius,
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 44,
                  child: const Text('Kurallar'),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
