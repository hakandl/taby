part of '../../view/game_view.dart';

class PauseCard extends StatelessWidget {
  const PauseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Icon(
        Icons.pause,
        size: 128,
        color: context.colorScheme.onPrimary,
      ),
    );
  }
}
