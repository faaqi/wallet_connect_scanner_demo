// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:wallet_connect_scanner_ui/wallet_connect_scanner_ui.dart';

class WCSBottomNavigationBar extends StatelessWidget {
  const WCSBottomNavigationBar({
    super.key,
    this.child,
    this.height,
  });

  final Widget? child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? WCSSpacing.xxxlg,
      child: Padding(
        padding: const EdgeInsets.only(
          left: WCSSpacing.md,
          right: WCSSpacing.md,
          bottom: WCSSpacing.md,
        ),
        child: child,
      ),
    );
  }
}
