// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:wallet_connect_scanner_ui/wallet_connect_scanner_ui.dart';

class WCSSafeArea extends StatelessWidget {
  const WCSSafeArea({
    required this.child,
    this.color,
    this.top = true,
    this.bottom = true,
    super.key,
  });

  final Widget child;
  final Color? color;
  final bool top;
  final bool bottom;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color ?? WCSColors.white,
      child: SafeArea(
        top: top,
        bottom: bottom,
        child: ColoredBox(
          color: Theme.of(context).colorScheme.background,
          child: child,
        ),
      ),
    );
  }
}
