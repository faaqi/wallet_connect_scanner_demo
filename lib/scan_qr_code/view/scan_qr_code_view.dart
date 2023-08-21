import 'package:flutter/material.dart';
import 'package:scan/scan.dart';
import 'package:wallet_connect_scanner_demo/common/extensions/extensions.dart';
import 'package:wallet_connect_scanner_demo/generated/assets.gen.dart';
import 'package:wallet_connect_scanner_demo/l10n/l10n.dart';
import 'package:wallet_connect_scanner_ui/wallet_connect_scanner_ui.dart';

class ScanQRCodeView extends StatelessWidget {
  ScanQRCodeView({
    required this.onQRCodeDetected,
    super.key,
  });

  static Route<void> route({
    required ValueChanged<String> onQRCodeDetected,
  }) {
    return MaterialPageRoute(
      builder: (ctx) {
        return ScanQRCodeView(
          onQRCodeDetected: onQRCodeDetected,
        );
      },
    );
  }

  final ValueChanged<String> onQRCodeDetected;
  final ScanController? controller = ScanController();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final centerOffset = ScreenMeasurements(context).centerOffset;

    final scanWindow = Rect.fromCenter(
      center: centerOffset,
      width: 200,
      height: 200,
    );
    return WillPopScope(
      onWillPop: () async {
        _navigateBack(context);
        return true;
      },
      child: WCSSafeArea(
        color: WCSColors.black,
        child: Scaffold(
          backgroundColor: WCSColors.black,
          appBar: WCSAppBar.primary(
            backgroundColor: WCSColors.black,
            titleText: l10n.scanQRCode,
            textColor: WCSColors.white,
            backButtonColor: WCSColors.white,
            onBackPress: () {
              _navigateBack(context);
            },
          ),
          body: Stack(
            children: <Widget>[
              ScanView(
                controller: controller,
                scanAreaScale: 0.5,
                scanLineColor: WCSColors.primaryContainer,
                onCapture: (val) {
                  onQRCodeDetected(val);
                  _navigateBack(context);
                },
              ),
              Center(
                child: Assets.images.qrCodeScannerWindow.svg(
                  width: scanWindow.width + WCSSpacing.xxs,
                  height: scanWindow.height,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _navigateBack(BuildContext context) {
  Navigator.pop(context);
}
