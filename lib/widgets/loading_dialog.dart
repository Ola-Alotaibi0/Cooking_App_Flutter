import 'package:cooking_app/widgets/app_large_text.dart';
import 'package:cooking_app/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void loadingDialog(BuildContext context, String titel, Widget _content) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: AppText(text: titel),
          content: _content,
        );
      });
}

void DialogWithButton(BuildContext context, String titel, String contentText) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
            title: AppLargeText(
              text: titel,
              color: Colors.green,
              size: 20,
            ),
            content: AppText(
              text: contentText,
            ),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ]);
      });
}
