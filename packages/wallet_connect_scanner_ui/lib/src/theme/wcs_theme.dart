import 'package:flutter/material.dart';
import 'package:wallet_connect_scanner_ui/wallet_connect_scanner_ui.dart';
import 'package:flutter/services.dart';

class WCSTheme {
  /// Light Theme example based on Material 2 Design.
  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: WCSColors.skyBlue,
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      iconTheme: _lightIconTheme,
      appBarTheme: _lightAppBarTheme,
      dividerTheme: _dividerTheme,
      textTheme: _lightTextTheme,
      buttonTheme: _buttonTheme,
      splashColor: WCSColors.transparent,
      elevatedButtonTheme: _elevatedButtonTheme,
      textButtonTheme: _textButtonTheme,
      colorScheme: _lightColorScheme,
      bottomSheetTheme: _lightBottomSheetTheme,
      listTileTheme: _listTileTheme,
      switchTheme: _switchTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
      tabBarTheme: _tabBarTheme,
      bottomNavigationBarTheme: _bottomAppBarTheme,
      chipTheme: _chipTheme,
      dividerColor: WCSColors.grey,
      outlinedButtonTheme: _lightOutlinedButtonTheme,
    );
  }

  /// Dark Theme example based on Material 2 Design.
  ThemeData get darkTheme => lightTheme.copyWith(
        chipTheme: _darkChipTheme,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: WCSColors.black,
        colorScheme: _darkColorScheme,
        appBarTheme: _darkAppBarTheme,
        disabledColor: WCSColors.white.withOpacity(0.5),
        textTheme: _darkTextTheme,
        unselectedWidgetColor: WCSColors.lightGrey,
        iconTheme: _darkIconTheme,
        bottomSheetTheme: _darkBottomSheetTheme,
        outlinedButtonTheme: _darkOutlinedButtonTheme,
        textButtonTheme: _darkTextButtonTheme,
      );

  /// Returns the correct color based on the current theme.
  ColorScheme get _lightColorScheme {
    return ColorScheme.light(
      primary: WCSColors.skyBlue,
      primaryContainer: WCSColors.lightBlue200,
      onPrimaryContainer: WCSColors.oceanBlue,
      secondary: WCSColors.paleSky,
      onSecondary: WCSColors.white,
      secondaryContainer: WCSColors.lightBlue200,
      onSecondaryContainer: WCSColors.oceanBlue,
      tertiary: WCSColors.secondary.shade700,
      onTertiary: WCSColors.white,
      tertiaryContainer: WCSColors.secondary.shade300,
      onTertiaryContainer: WCSColors.secondary.shade700,
      error: WCSColors.red,
      errorContainer: WCSColors.red.shade200,
      onErrorContainer: WCSColors.redWine,
      background: _backgroundColor,
      onBackground: WCSColors.onBackground,
      surfaceVariant: WCSColors.surface,
      onSurfaceVariant: WCSColors.grey,
      inversePrimary: WCSColors.crystalBlue,
    );
  }

  /// Returns the correct color based on the current theme.
  ColorScheme get _darkColorScheme => _lightColorScheme.copyWith(
        background: WCSColors.black,
        onBackground: WCSColors.white,
        surface: WCSColors.black,
        onSurface: WCSColors.lightGrey,
        primary: WCSColors.blue,
        onPrimary: WCSColors.oceanBlue,
        primaryContainer: WCSColors.oceanBlue,
        onPrimaryContainer: WCSColors.lightBlue200,
        secondary: WCSColors.paleSky,
        onSecondary: WCSColors.lightGrey,
        secondaryContainer: WCSColors.liver,
        onSecondaryContainer: WCSColors.brightGrey,
      );

  /// Returns the correct background color based on the current theme.
  Color get _backgroundColor => WCSColors.white;

  /// Returns the correct [AppBarTheme] based on the current theme.
  AppBarTheme get _lightAppBarTheme {
    return AppBarTheme(
      iconTheme: _lightIconTheme,
      titleTextStyle: _lightTextTheme.titleMedium,
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: WCSColors.white,
      toolbarTextStyle: _lightTextTheme.titleLarge,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  /// Returns the correct [AppBarTheme] based on the current theme.
  AppBarTheme get _darkAppBarTheme {
    return _lightAppBarTheme.copyWith(
      backgroundColor: WCSColors.grey,
      iconTheme: _darkIconTheme,
      toolbarTextStyle: _darkTextTheme.titleLarge,
      titleTextStyle: _darkTextTheme.titleMedium,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _lightIconTheme {
    return const IconThemeData(
      color: WCSColors.black,
    );
  }

  /// Returns the correct [IconThemeData] based on the current theme.
  IconThemeData get _darkIconTheme {
    return const IconThemeData(
      color: WCSColors.white,
    );
  }

  /// Returns the correct [DividerThemeData] based on the current theme.
  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: WCSColors.outlineLight,
      space: WCSSpacing.lg,
      thickness: WCSSpacing.xxxs,
      indent: WCSSpacing.lg,
      endIndent: WCSSpacing.lg,
    );
  }

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _lightTextTheme => lightUITextTheme;

  /// Returns the correct [TextTheme] based on the current theme.
  TextTheme get _darkTextTheme {
    return _lightTextTheme.apply(
      bodyColor: WCSColors.white,
      displayColor: WCSColors.white,
      decorationColor: WCSColors.white,
    );
  }

  /// The UI text theme based on [WCSTextStyle].
  static final lightUITextTheme = TextTheme(
    displayLarge: WCSTextStyle.headline1,
    displayMedium: WCSTextStyle.headline2,
    displaySmall: WCSTextStyle.headline3,
    titleMedium: WCSTextStyle.subtitle1,
    titleSmall: WCSTextStyle.subtitle2,
    bodyLarge: WCSTextStyle.bodyText1,
    bodyMedium: WCSTextStyle.bodyText2,
    labelLarge: WCSTextStyle.button,
    bodySmall: WCSTextStyle.caption,
    labelSmall: WCSTextStyle.overline,
  ).apply(
    bodyColor: WCSColors.black,
    displayColor: WCSColors.black,
    decorationColor: WCSColors.black,
  );

  /// Returns the correct [ChipThemeData] based on the current theme.
  ChipThemeData get _chipTheme {
    return ChipThemeData(
      backgroundColor: WCSColors.secondary.shade300,
      disabledColor: _backgroundColor,
      selectedColor: WCSColors.secondary.shade700,
      secondarySelectedColor: WCSColors.secondary.shade700,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      labelStyle: WCSTextStyle.button.copyWith(color: WCSColors.black),
      secondaryLabelStyle:
          WCSTextStyle.labelSmall.copyWith(color: WCSColors.white),
      brightness: Brightness.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(),
      ),
    );
  }

  /// Returns the correct [ChipThemeData] based on the current theme.
  ChipThemeData get _darkChipTheme {
    return _chipTheme.copyWith(
      backgroundColor: WCSColors.white,
      disabledColor: _backgroundColor,
      selectedColor: WCSColors.secondary.shade700,
      secondarySelectedColor: WCSColors.secondary.shade700,
      labelStyle: WCSTextStyle.button.copyWith(
        color: WCSColors.secondary.shade700,
      ),
      secondaryLabelStyle: WCSTextStyle.labelSmall.copyWith(
        color: WCSColors.black,
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: WCSColors.white, width: 2),
        borderRadius: BorderRadius.circular(22),
      ),
    );
  }

  /// Returns the correct [ButtonThemeData] based on the current theme.
  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(WCSSpacing.sm),
      ),
      padding: const EdgeInsets.symmetric(vertical: WCSSpacing.lg),
      buttonColor: WCSColors.blue,
      disabledColor: WCSColors.lightGrey,
      height: 48,
      minWidth: 48,
    );
  }

  /// Returns the correct [ElevatedButtonThemeData] based on the current theme.
  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        padding: const EdgeInsets.symmetric(vertical: WCSSpacing.lg),
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: WCSFontWeight.bold,
        ),
        backgroundColor: WCSColors.blue,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: WCSFontWeight.light,
        ),
        foregroundColor: WCSColors.black,
      ),
    );
  }

  /// Returns the correct [TextButtonThemeData] based on the current theme.
  TextButtonThemeData get _darkTextButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _lightTextTheme.labelLarge?.copyWith(
          fontWeight: WCSFontWeight.light,
        ),
        foregroundColor: WCSColors.white,
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _lightBottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: WCSColors.modalBackground,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(WCSSpacing.lg),
          topRight: Radius.circular(WCSSpacing.lg),
        ),
      ),
    );
  }

  /// Returns the correct [BottomSheetThemeData] based on the current theme.
  BottomSheetThemeData get _darkBottomSheetTheme {
    return _lightBottomSheetTheme.copyWith(
      backgroundColor: WCSColors.grey,
    );
  }

  /// Returns the correct [ListTileThemeData] based on the current theme.
  ListTileThemeData get _listTileTheme {
    return const ListTileThemeData(
      iconColor: WCSColors.onBackground,
      contentPadding: EdgeInsets.all(WCSSpacing.lg),
    );
  }

  /// Returns the correct [SwitchThemeData] based on the current theme.
  SwitchThemeData get _switchTheme {
    return SwitchThemeData(
      thumbColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return WCSColors.darkAqua;
        }
        return WCSColors.black;
      }),
      trackColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return WCSColors.primaryContainer;
        }
        return WCSColors.paleSky;
      }),
    );
  }

  /// Returns the correct [ProgressIndicatorThemeData] based on the current
  /// theme.
  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: WCSColors.darkAqua,
      circularTrackColor: WCSColors.borderOutline,
    );
  }

  /// Returns the correct [TabBarTheme] based on the current theme.
  TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      labelStyle: WCSTextStyle.button,
      labelColor: WCSColors.darkAqua,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: WCSSpacing.lg,
        vertical: WCSSpacing.md + WCSSpacing.xxs,
      ),
      unselectedLabelStyle: WCSTextStyle.button,
      unselectedLabelColor: WCSColors.mediumEmphasisSurface,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          color: WCSColors.darkAqua,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

  /// Returns the correct [BottomNavigationBarThemeData] based on the current
  /// theme.
  BottomNavigationBarThemeData get _bottomAppBarTheme {
    return BottomNavigationBarThemeData(
      backgroundColor: WCSColors.black,
      selectedItemColor: WCSColors.white,
      unselectedItemColor: WCSColors.white.withOpacity(0.74),
    );
  }

  /// Returns the correct [OutlinedButtonThemeData] based on the current theme.
  OutlinedButtonThemeData get _lightOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => WCSColors.white,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: WCSSpacing.xlg,
            vertical: WCSSpacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? WCSTextStyle.button.copyWith(
                  color: WCSColors.black,
                  fontWeight: FontWeight.w500,
                )
              : WCSTextStyle.button.copyWith(
                  color: states.contains(MaterialState.disabled)
                      ? WCSColors.black
                      : WCSColors.white,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }

  /// Returns the correct [OutlinedButtonThemeData] based on the current theme.
  OutlinedButtonThemeData get _darkOutlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => WCSColors.black,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(color: WCSColors.white),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: WCSSpacing.xlg,
            vertical: WCSSpacing.lg,
          ),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? WCSTextStyle.button.copyWith(
                  color: WCSColors.white,
                  fontWeight: FontWeight.w500,
                )
              : WCSTextStyle.button.copyWith(
                  color: states.contains(MaterialState.disabled)
                      ? WCSColors.black
                      : WCSColors.white,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }
}
