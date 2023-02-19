import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:taby/core/base/view/base_view.dart';
import 'package:taby/feature/settings/viewmodel/settings_viewmodel.dart';
import 'package:taby/product/widgets/container/row_settings_container.dart';
import 'package:taby/product/widgets/input/team_name_textfield.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
        viewModel: SettingsViewModel(),
        onDispose: (model) {
          model.textFieldDispose();
        },
        onPageBuilder: (context, value) => GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                appBar: AppBar(
                  leading: BackButton(
                    color: context.colorScheme.onPrimary,
                    onPressed: () {
                      context.read<SettingsViewModel>().changeTeamName();
                      context.pop();
                    },
                  ),
                  title: const Text('Ayarlar'),
                ),
                body: SafeArea(
                  child: SingleChildScrollView(
                    padding: context.horizontalPaddingNormal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        context.emptySizedHeightBoxLow3x,
                        RowSettingsContainer(
                          center: false,
                          text: 'Ses & Titreşim',
                          onPressedL: () => context.read<SettingsViewModel>().vibrationSettings(),
                          onPressedR: () => context.read<SettingsViewModel>().soundSettings(),
                        ),
                        context.emptySizedHeightBoxLow3x,
                        Divider(
                          thickness: 2,
                          color: context.colorScheme.primary,
                          indent: context.width * .02,
                          endIndent: context.width * .02,
                        ),
                        context.emptySizedHeightBoxLow3x,
                        textFieldContainer(context, context.watch<SettingsViewModel>().firstTeamTextField),
                        context.emptySizedHeightBoxLow3x,
                        textFieldContainer(context, context.watch<SettingsViewModel>().secondTeamTextField),
                        context.emptySizedHeightBoxLow3x,
                        RowSettingsContainer(
                          text: '${context.watch<SettingsViewModel>().score} puan',
                          onPressedL: () => context.read<SettingsViewModel>().downScore(),
                          onPressedR: () => context.read<SettingsViewModel>().upScore(),
                        ),
                        context.emptySizedHeightBoxLow3x,
                        RowSettingsContainer(
                          text: '${context.watch<SettingsViewModel>().seconds} saniye',
                          onPressedL: () => context.read<SettingsViewModel>().downSeconds(),
                          onPressedR: () => context.read<SettingsViewModel>().upSeconds(),
                        ),
                        context.emptySizedHeightBoxLow3x,
                        RowSettingsContainer(
                          text: '${context.watch<SettingsViewModel>().skip} pas',
                          onPressedL: () => context.read<SettingsViewModel>().downSkip(),
                          onPressedR: () => context.read<SettingsViewModel>().upSkip(),
                        ),
                        context.emptySizedHeightBoxLow3x,
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }

  Container textFieldContainer(BuildContext context, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: context.normalBorderRadius,
        color: context.colorScheme.primary,
      ),
      padding: context.paddingNormal,
      child: TeamTextField(
        context: context,
        controller: controller,
      ),
    );
  }
}
