import 'package:flutter/material.dart';
import 'package:wallet_connect_scanner_ui/wallet_connect_scanner_ui.dart';

/// {@template xs_text_form_field}
/// A Text field component that uses the material component [TextFormField].
/// All the underlaying props are available.
///
/// ```dart
/// SCTextFormField()
/// ```
/// {@endtemplate}
class WCSTextFormField extends TextFormField {
  /// {@macro lb_text_form_field}
  WCSTextFormField({
    super.key,
    super.controller,
    super.initialValue,
    super.keyboardType,
    super.textCapitalization,
    InputDecoration? decoration,
    String hintText = '',
    String? errorText,
    String? label,
    super.inputFormatters,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
    super.validator,
    super.onChanged,
    super.onFieldSubmitted,
    super.obscureText,
    super.autofocus,
    super.textInputAction,
    super.autocorrect,
    bool super.enabled = true,
    FocusNode? focusNode,
    super.onSaved,
    int? maxlength,
    bool noOutlineBorder = false,
    super.readOnly,
    Widget? suffixIcon,
    Widget? prefix,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    EdgeInsets? contentPadding,
    final Color themeColor = WCSColors.black,
    super.onTap,
  }) : super(
          maxLength: maxlength,
          style: textStyle ?? WCSTextStyle.bodyText1,
          cursorColor: themeColor,
          decoration: decoration ??
              (noOutlineBorder
                  ? InputDecoration(
                      labelText: label,
                      hintText: hintText,
                      prefix: prefix,
                      suffixIcon: suffixIcon,
                      suffixIconConstraints: const BoxConstraints(
                        maxHeight: 1,
                      ),
                      labelStyle: WCSTextStyle.labelSmall.copyWith(
                        fontSize: focusNode == null
                            ? WCSSpacing.md
                            : focusNode.hasFocus
                                ? WCSSpacing.md
                                : WCSSpacing.md,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        top: WCSSpacing.xlg,
                        bottom: WCSSpacing.xs,
                      ),
                    )
                  : InputDecoration(
                      prefixIcon: prefix,
                      errorText: errorText,
                      labelText: label,
                      labelStyle: textStyle,
                      hintText: hintText,
                      hintStyle: hintStyle,
                      contentPadding: contentPadding,
                      border: _outlineInputBorder(borderColor: themeColor),
                      focusedBorder:
                          _outlineInputBorder(borderColor: themeColor),
                      enabledBorder:
                          _outlineInputBorder(borderColor: themeColor),
                      disabledBorder:
                          _outlineInputBorder(borderColor: themeColor),
                    )),
        );

  /// {@macro lb_text_form_field}
  WCSTextFormField.optionalLabel({
    super.key,
    super.controller,
    super.initialValue,
    super.keyboardType,
    super.textCapitalization,
    InputDecoration super.decoration,
    super.inputFormatters,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
    super.validator,
    super.onChanged,
    super.onFieldSubmitted,
    super.obscureText,
    super.autofocus,
    super.textInputAction,
    super.autocorrect,
    super.style,
    bool super.enabled = true,
    super.focusNode,
    super.onSaved,
  });

  static OutlineInputBorder _outlineInputBorder({
    Color? borderColor = WCSColors.black,
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor ?? WCSColors.black,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(
          WCSSpacing.sm,
        ),
      ),
    );
  }
}
