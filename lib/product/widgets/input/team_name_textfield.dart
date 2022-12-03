import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class TeamTextField extends TextField {
  TeamTextField({
    required BuildContext context,
    Key? key,
    String? title,
    TextEditingController? controller,
  }) : super(
          key: key,
          style: context.textTheme.headline6,
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            hintText: title,
            hintStyle: context.textTheme.headline6,
            border: InputBorder.none,
          ),
        );
}
