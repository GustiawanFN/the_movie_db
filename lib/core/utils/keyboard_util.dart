import 'package:flutter/material.dart';

abstract class KeyboardUtil {
  static bool isKeyboardAlive(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0.0;
  }

  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
