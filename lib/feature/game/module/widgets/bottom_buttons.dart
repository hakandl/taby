part of '../../view/game_view.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key, required this.value});
  final GameViewModel value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FixedSizeElevatedButton(
          backgroundColor: context.colorScheme.error,
          child: Icon(
            context.watch<GameViewModel>().timer != null && !context.watch<GameViewModel>().timer!.isActive
                ? Icons.exit_to_app
                : Icons.close,
          ),
          onPressed: () => check(context) ? context.navigateToPage(const HomeView()) : value.removeScore(),
        ),
        check(context)
            ? const SizedBox.shrink()
            : FixedSizeElevatedButton(
                backgroundColor: context.colorScheme.background,
                onPressed: value.skipCount == 0 ? null : () => value.skip(),
                child: const Icon(
                  Icons.cached_rounded,
                ),
              ),
        FixedSizeElevatedButton(
          backgroundColor: context.colorScheme.onBackground,
          child: Icon(
            context.watch<GameViewModel>().timer != null && !context.watch<GameViewModel>().timer!.isActive
                ? Icons.play_arrow
                : Icons.check,
          ),
          onPressed: () => check(context)
              ? value.remainingTime == 0
                  ? value.reset()
                  : value.startTimer()
              : value.addScore(),
        ),
      ],
    );
  }

  bool check(BuildContext context) =>
      context.read<GameViewModel>().timer != null && !context.read<GameViewModel>().timer!.isActive;
}
