// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:wallet_connect_scanner_ui/wallet_connect_scanner_ui.dart';

class WCSAppBar extends AppBar {
  WCSAppBar({
    super.key,
    Color? backgroundColor,
    super.title,
  }) : super(
          backgroundColor: backgroundColor ?? WCSColors.white,
        );

  WCSAppBar.primary({
    super.key,
    Color? foregroundColor,
    Color? backgroundColor,
    Color? shadowColor,
    double? elevation,
    String titleText = '',
    Color textColor = WCSColors.black,
    Color backButtonColor = WCSColors.black,
    VoidCallback? onBackPress,
  }) : super(
          foregroundColor: foregroundColor ?? WCSColors.white,
          backgroundColor: backgroundColor ?? WCSColors.white,
          shadowColor: shadowColor ?? WCSColors.black,
          elevation: elevation ?? 0,
          automaticallyImplyLeading: false,
          leading: onBackPress != null
              ? BackButton(
                  onPressed: onBackPress,
                  color: backButtonColor,
                )
              : null,
          title: Text(
            titleText,
            style: WCSTextStyle.bodyText1.copyWith(
              color: textColor,
            ),
          ),
        );
}
