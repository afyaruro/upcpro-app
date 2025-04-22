import 'package:flutter/material.dart';

class WidgetBase extends StatefulWidget {
  final Widget child;

  const WidgetBase({super.key, required this.child});

  @override
  State<WidgetBase> createState() => _WidgetBaseState();
}

class _WidgetBaseState extends State<WidgetBase> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus && focus.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },

      child: widget.child,
    );
  }
}
