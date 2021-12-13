import 'package:flutter/material.dart';

class RootWidget extends StatelessWidget {
  const RootWidget({Key? key, this.child}) : super(key: key);
  final Widget? child;

  static Widget builder(BuildContext context, Widget? screen) =>
      RootWidget(child: screen);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (ctx) => RootKeyboardManager(child: child));
  }
}

/// Manage keyboard close, when touch.
class RootKeyboardManager extends StatelessWidget {
  const RootKeyboardManager({Key? key, this.child}) : super(key: key);
  final Widget? child;

  /// Allow close keyboard when on tap.
  static bool allowCloseKeyboard = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (allowCloseKeyboard) {
          WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
