import 'package:wallet_connect_scanner_ui/wallet_connect_scanner_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WCSIconsDark extends WCSIcon {
  @override
  SvgPicture backIcon({double? size, Color? color}) {
    return super.backIcon(
      color: color ?? WCSColors.white,
      size: size ?? 14,
    );
  }

  @override
  SvgPicture emailOutline({double? size, Color? color}) {
    return super.emailOutline(
      color: color ?? WCSColors.white,
      size: size ?? 14,
    );
  }
}
