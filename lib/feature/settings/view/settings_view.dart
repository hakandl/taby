import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:tabu/product/widgets/container/row_settings_container.dart';
import 'package:tabu/product/widgets/input/team_name_textfield.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: context.colorScheme.onPrimary,
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
                onPressedL: () {},
                onPressedR: () {},
              ),
              context.emptySizedHeightBoxLow3x,
              Divider(
                thickness: 2,
                color: context.colorScheme.primary,
                indent: context.width * .02,
                endIndent: context.width * .02,
              ),
              context.emptySizedHeightBoxLow3x,
              textFieldContainer(context, 'takim adi'),
              context.emptySizedHeightBoxLow3x,
              textFieldContainer(context, 'takim adi 2'),
              context.emptySizedHeightBoxLow3x,
              RowSettingsContainer(
                text: '20 puan',
                onPressedL: () {},
                onPressedR: () {},
              ),
              context.emptySizedHeightBoxLow3x,
              RowSettingsContainer(
                text: '90 saniye',
                onPressedL: () {},
                onPressedR: () {},
              ),
              context.emptySizedHeightBoxLow3x,
              RowSettingsContainer(
                text: '3 pas',
                onPressedL: () {},
                onPressedR: () {},
              ),
              context.emptySizedHeightBoxLow3x,
            ],
          ),
        ),
      ),
    );
  }

  Container textFieldContainer(BuildContext context, String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: context.normalBorderRadius,
        color: context.colorScheme.primary,
      ),
      padding: context.paddingNormal,
      child: TeamTextField(
        context: context,
        title: title,
      ),
    );
  }
}
