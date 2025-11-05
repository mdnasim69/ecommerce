import 'package:flutter/material.dart';

void ShowMessage(BuildContext context, String msg, [bool IsError = false]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(msg), backgroundColor: IsError ? Colors.red : null),
  );
}
