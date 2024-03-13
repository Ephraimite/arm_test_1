import 'package:flutter/cupertino.dart';

void dismissKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

void popSheet(BuildContext context) {
  Navigator.of(context).pop();
}

void closeDialog(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}