import 'package:wallet_connect_scanner_ui/wallet_connect_scanner_ui.dart';
import 'package:flutter/material.dart';

///Extension on Themedata that must be added to return the correct asset
extension ThemeX on ThemeData {
  ///Returns the correct SCIcon based on the current theme
  WCSIcon get icons {
    final isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      return WCSIconsDark();
    } else {
      return WCSIconsLight();
    }
  }
}
