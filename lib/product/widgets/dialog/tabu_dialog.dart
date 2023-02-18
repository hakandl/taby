import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:taby/product/widgets/buttons/fixed_size_elevated_button.dart';

mixin TabuShowDialog {
  Future<T?> showTabuShowDialog<T>(
    BuildContext context, {
    String? title,
    String? content,
    required VoidCallback onPressed,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => TabuAlertDialog(
        title: title,
        content: content,
        onPressed: onPressed,
      ),
    );
  }
}

class TabuAlertDialog extends StatelessWidget {
  const TabuAlertDialog({
    Key? key,
    required this.onPressed,
    this.title,
    this.content,
  }) : super(key: key);
  final String? title;
  final String? content;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colorScheme.primary,
      title: Text(title ?? 'AAAAA'),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: context.height / 5,
        ),
        child: Text(content ?? 'AAA'),
      ),
      actions: [
        _saveButton(),
      ],
      titleTextStyle: context.textTheme.headline5?.copyWith(
        color: context.colorScheme.onPrimary,
        fontWeight: FontWeight.w500,
      ),
      contentTextStyle: context.textTheme.headline5?.copyWith(
        color: context.colorScheme.onPrimary,
      ),
    );
  }

  Widget _saveButton() {
    return FixedSizeElevatedButton(
      onPressed: onPressed,
      elevation: 0,
      child: const Icon(
        Icons.play_arrow,
        size: 40,
      ),
    );
  }
}
