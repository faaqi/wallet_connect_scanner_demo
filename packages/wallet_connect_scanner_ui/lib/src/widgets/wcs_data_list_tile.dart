import 'package:flutter/material.dart';
import 'package:wallet_connect_scanner_ui/wallet_connect_scanner_ui.dart';

class WCSDataListTile extends StatelessWidget {
  const WCSDataListTile({
    required this.title,
    required this.value,
    this.formattedValue,
    this.showStatusChip = false,
    this.statusColor = WCSColors.black,
    super.key,
  });

  final String title;
  final String value;
  final String? formattedValue;
  final bool showStatusChip;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: WCSSpacing.lg,
        horizontal: WCSSpacing.xlg,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: WCSSpacing.xlg,
      ),
      decoration: const BoxDecoration(
        color: WCSColors.lightGrey,
        borderRadius: BorderRadius.all(Radius.circular(WCSSpacing.md)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: WCSTextStyle.bodyText1.copyWith(
              fontWeight: WCSFontWeight.bold,
            ),
          ),
          Text(
            value,
            style: WCSTextStyle.bodyText1.copyWith(
              fontWeight: WCSFontWeight.bold,
              color: showStatusChip ? statusColor : statusColor,
            ),
          ),
        ],
      ),
    );
  }
}
