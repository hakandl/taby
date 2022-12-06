part of '../../view/game_view.dart';

class ChangeTeamCard extends StatelessWidget {
  const ChangeTeamCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.timer_outlined,
            color: context.colorScheme.onPrimary,
            size: 128,
          ),
          Text(
            'Süre doldu',
            style: context.textTheme.headline2,
          ),
          Text(
            'Telefonu diğer takıma verin',
            style: context.textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
