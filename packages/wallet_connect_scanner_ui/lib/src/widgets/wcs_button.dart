// ignore_for_file: public_member_api_docs, always_put_required_named_parameters_first, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:wallet_connect_scanner_ui/wallet_connect_scanner_ui.dart';

/// {@template WalletUIButton}
/// A Wallet UI Button.
///
/// ```dart
/// WalletButton(
///   onPressed: () {
///     print('Tapped!');
///   },
///   child: Text('Button'),
/// )
/// ```
/// {@endtemplate}
class WCSUIButton extends TextButton {
  /// {@macro CSTextButton}
  const WCSUIButton({
    super.key,
    required VoidCallback super.onPressed,
    required super.child,
  });

  WCSUIButton.textButton({
    super.key,
    required VoidCallback super.onPressed,
    required super.child,
    required double fontSize,
  }) : super(
          style: TextButton.styleFrom(
            backgroundColor: WCSColors.white,
            textStyle: WCSTextStyle.bodyText1.copyWith(
              fontSize: fontSize,
              color: WCSColors.black,
            ),
          ),
        );
}

/// {@template WalletElevatedButton}
/// A Wallet UI Elevated Button.
///
/// Use elevated buttons to add dimension to otherwise mostly flat
/// layouts, e.g.  in long busy lists of content, or in wide
/// spaces. Avoid using elevated buttons on already-elevated content
/// such as dialogs or cards.
///
/// ```dart
/// WalletUIElevatedButton(
///   child: FlutterLogo(),
///   onPressed: () {
///     print('Tapped!');
///   },
/// )
/// ```
/// {@endtemplate}
class WCSElevatedButton extends ElevatedButton {
  /// {@macro WalletElevatedButton}
  const WCSElevatedButton({
    super.key,
    required VoidCallback super.onPressed,
    required Widget super.child,
    super.style,
  });

  WCSElevatedButton.primary({
    super.key,
    required VoidCallback? onPressed,
    required Widget child,
    Color? backgroundColor,
    Color? foregroundColor,
    ButtonStyle? style,
    OutlinedBorder? shape,
    double? height,
    double? width,
    EdgeInsets? padding,
    double radius = WCSSpacing.sm,
    bool disabled = false,
  }) : super(
          onPressed: disabled ? null : onPressed,
          child: _WCSButtonWithChild(
            label: child,
          ),
          style: style ??
              ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: backgroundColor ?? WCSColors.black,
                foregroundColor: foregroundColor ?? WCSColors.white,
                textStyle: WCSTextStyle.button.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                padding: padding ??
                    const EdgeInsets.symmetric(
                      horizontal: WCSSpacing.md,
                      vertical: WCSSpacing.md,
                    ),
                shape: shape ??
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                    ),
                minimumSize: Size(
                  width ?? 220,
                  height ?? 50,
                ),
                maximumSize: Size(
                  width ?? 220,
                  height ?? 50,
                ),
              ),
        );

  WCSElevatedButton.icon({
    super.key,
    required VoidCallback onPressed,
    required Widget label,
    required Widget icon,
    Color? backgroundColor,
    Color? foregroundColor,
    ButtonStyle? style,
    OutlinedBorder? shape,
    double? height,
    double? width,
    EdgeInsets? padding,
    double radius = WCSSpacing.sm,
    bool disabled = false,
    Size? maximumSize,
    double gap = WCSSpacing.xs,
  }) : super(
          onPressed: disabled ? null : onPressed,
          child: _WCSButtonWithIcon(
            label: label,
            gap: gap,
            icon: icon,
          ),
          style: style ??
              ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: backgroundColor ?? WCSColors.black,
                foregroundColor: foregroundColor ?? WCSColors.white,
                textStyle: WCSTextStyle.headline3.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                padding: padding ??
                    const EdgeInsets.symmetric(
                      horizontal: WCSSpacing.md,
                      vertical: WCSSpacing.md,
                    ),
                shape: shape ??
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                    ),
                minimumSize: maximumSize ??
                    Size(
                      width ?? 186,
                      height ?? 45,
                    ),
                maximumSize: maximumSize,
              ),
        );

  WCSElevatedButton.secondary({
    super.key,
    required VoidCallback super.onPressed,
    required Widget super.child,
    required double height,
    required double width,
    required double fontSize,
    required EdgeInsets padding,
    required double radius,
  }) : super(
          style: ElevatedButton.styleFrom(
            backgroundColor: WCSColors.black,
            foregroundColor: WCSColors.black,
            textStyle: WCSTextStyle.labelSmall.copyWith(fontSize: fontSize),
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            minimumSize: Size(width, height),
          ),
        );
}

class _WCSButtonWithChild extends StatelessWidget {
  const _WCSButtonWithChild({
    required this.label,
  });

  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Expanded(child: Center(child: label))],
    );
  }
}

class _WCSButtonWithIcon extends StatelessWidget {
  const _WCSButtonWithIcon({
    required this.label,
    required this.icon,
    this.gap = 0,
  });

  final Widget label;
  final Widget icon;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        icon,
        SizedBox(
          width: gap,
        ),
        label,
      ],
    );
  }
}
