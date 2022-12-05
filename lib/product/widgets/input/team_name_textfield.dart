import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class TeamTextField extends TextField {
  TeamTextField({
    super.key,
    required BuildContext context,
    TextEditingController? controller,
  }) : super(
          style: context.textTheme.headline6,
          controller: controller,
          decoration: const InputDecoration(
            isDense: true,
            border: InputBorder.none,
          ),
        );
}
