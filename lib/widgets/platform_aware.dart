import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sanity/widgets/platform_widget.dart';

class PlatformAADialog extends PlatformWidget {
  const PlatformAADialog(
      {this.cancelActionText,
      required this.title,
      required this.content,
      required this.defaultActionText});

  final String title;
  final String content;
  final String defaultActionText;
  final String? cancelActionText;

  Future<bool> show(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog(
            context: context, builder: (context) => this)
        : showDialog(context: context, builder: (context) => this);
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      content: Text(content),
      title: Text(title),
      actions: _buildActions(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff202020),
      content: Text(content, style: const TextStyle(color: Colors.white)),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    final action = <Widget>[];
    if (cancelActionText != null) {
      action.add(PlatformAlertDialogAction(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(cancelActionText!,
              style: const TextStyle(color: Colors.white))));
    }

    action.add(PlatformAlertDialogAction(
        onPressed: () {
          Navigator.of(context).pop(true);
        },
        child: Text("OK", style: TextStyle(color: Colors.pink))));
    return action;
  }
}

class PlatformAlertDialogAction extends PlatformWidget {
  const PlatformAlertDialogAction({this.child, this.onPressed});

  final Widget? child;
  final VoidCallback? onPressed;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      onPressed: onPressed,
      child: child!,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child!,
    );
  }
}