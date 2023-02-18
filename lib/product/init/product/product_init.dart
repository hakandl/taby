import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:taby/feature/game/viewmodel/game_viewmodel.dart';
import 'package:taby/feature/settings/viewmodel/settings_viewmodel.dart';

class ProductInit {
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<GameViewModel>(
      create: (context) => GameViewModel(),
    ),
    ChangeNotifierProvider<SettingsViewModel>(
      create: (context) => SettingsViewModel(),
    )
  ];
}
