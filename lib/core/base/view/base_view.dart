import 'package:flutter/material.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final T viewModel;
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final Function(T model)? onModelReady;
  final Function(T model)? onDispose;

  const BaseView({Key? key, required this.viewModel, required this.onPageBuilder, this.onModelReady, this.onDispose})
      : super(key: key);

  @override
  BaseViewState<T> createState() => BaseViewState();
}

class BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    super.initState();
    model = widget.viewModel;
    if (widget.onModelReady != null) widget.onModelReady!(model);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!(model);
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}
