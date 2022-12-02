import 'package:flutter/material.dart';

mixin TabuShowDialog {
  Future<T?> showTabuShowDialog<T>(
    BuildContext context, {
    String? title,
    String? content,
    required VoidCallback onPressed,
  }) async {
    return showDialog(
      context: context,
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
      title: Text(title ?? 'AAAAA'),
      content: Text(content ?? 'AAA'),
      actions: [
        Row(
          children: [
            const Spacer(),
            _saveButton(),
          ],
        ),
      ],
    );
  }

  ElevatedButton _saveButton() {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text(
        'baa',
      ),
    );
  }
}
