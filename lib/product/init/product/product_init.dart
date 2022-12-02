import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tabu/feature/game/viewmodel/game_viewmodel.dart';

class ProductInit {
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<GameViewModel>(
      create: (context) => GameViewModel(),
    )
  ];
}
