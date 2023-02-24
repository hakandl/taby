part of '../../view/game_view.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key, required this.value});
  final GameViewModel value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: !context.watch<GameViewModel>().isAdLoading ? _cancelButton(context) : const SizedBox.shrink(),
          ),
          timerCheck()
              ? const SizedBox.shrink()
              : Expanded(
                  child: _skipButton(context),
                ),
          Expanded(
            child: !context.watch<GameViewModel>().isAdLoading ? _okButton(context) : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Padding _cancelButton(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: FixedSizeElevatedButton(
        backgroundColor: context.colorScheme.error,
        child: Icon(
          context.watch<GameViewModel>().timer != null && !context.watch<GameViewModel>().timer!.isActive
              ? Icons.exit_to_app
              : Icons.close,
        ),
        onPressed: () => timerCheck()
            ? Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ),
                (Route<dynamic> route) => false)
            : value.removeScore(),
      ),
    );
  }

  Padding _skipButton(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: FixedSizeElevatedButton(
        backgroundColor: context.colorScheme.background,
        onPressed: value.skipCount == 0 ? null : () => value.skip(),
        child: const Icon(
          Icons.cached_rounded,
        ),
      ),
    );
  }

  Padding _okButton(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: FixedSizeElevatedButton(
        backgroundColor: context.colorScheme.onBackground,
        child: Icon(
          timerCheck()
              ? value.remainingTime == 0
                  ? winCheck(context)
                      ? Icons.thumb_up_outlined
                      : Icons.play_arrow
                  : Icons.play_arrow
              : Icons.check,
        ),
        onPressed: () => timerCheck()
            ? value.remainingTime == 0
                ? winCheck(context)
                    ? context.navigateToPage(const GameView())
                    : value.reset()
                : value.startTimer()
            : value.addScore(),
      ),
    );
  }

  bool timerCheck() => value.timer != null && !value.timer!.isActive;

  bool winCheck(BuildContext context) =>
      value.firstTeamScore >= context.read<SettingsViewModel>().score ||
      value.secondTeamScore >= context.read<SettingsViewModel>().score;
}
