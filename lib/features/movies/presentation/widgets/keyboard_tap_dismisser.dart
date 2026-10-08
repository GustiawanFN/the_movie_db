import 'package:flutter/material.dart';
import 'package:the_movie_db/core/utils/keyboard_util.dart';

class KeyboardTapDismisser extends StatelessWidget {
  final Widget child;

  const KeyboardTapDismisser({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(behavior: HitTestBehavior.opaque, onTap: KeyboardUtil.dismissKeyboard, child: child);
  }
}
