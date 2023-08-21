import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wallet_connect_scanner_ui/wallet_connect_scanner_ui.dart';

class WCSProgressIndicator extends StatelessWidget {
  const WCSProgressIndicator({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
      inAsyncCall: isLoading,
      blurEffectIntensity: 4,
      progressIndicator: const SpinKitThreeInOut(
        color: WCSColors.orangeAccent,
      ),
      dismissible: false,
      opacity: 0.2,
      color: WCSColors.orangeAccent,
      child: child,
    );
  }
}
