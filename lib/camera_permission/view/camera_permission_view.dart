import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallet_connect_scanner_demo/app_lifecycle/app_lifecycle.dart';
import 'package:wallet_connect_scanner_demo/camera_permission/camera_permission.dart';
import 'package:wallet_connect_scanner_demo/common/extensions/extensions.dart';
import 'package:wallet_connect_scanner_demo/generated/assets.gen.dart';
import 'package:wallet_connect_scanner_demo/l10n/l10n.dart';
import 'package:wallet_connect_scanner_ui/wallet_connect_scanner_ui.dart';

class CameraPermissionView extends StatelessWidget {
  const CameraPermissionView({
    super.key,
  });

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (ctx) {
        return const CameraPermissionView();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppLifecycleListener(
      onResumedState: () {
        context.read<CameraPermissionBloc>().add(const CheckCameraPermission());
        Navigator.of(context).pop();
      },
      child: WCSSafeArea(
        child: Scaffold(
          appBar: WCSAppBar.primary(
            titleText: 'yourPublicWalletAddress',
          ),
          bottomNavigationBar: _BottomBar(context: context, l10n: l10n),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: WCSSpacing.mlg,
                vertical: WCSSpacing.sm,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: WCSSpacing.lg,
                  ),
                  Text(
                    ' l10n.cameraAccessDenied',
                    style: WCSTextStyle.headline4,
                  ),
                  const SizedBox(
                    height: WCSSpacing.xxs,
                  ),
                  Text(
                    'l10n.cantScanQRCodeWithoutCameraAccess',
                    style: WCSTextStyle.bodyText1.copyWith(
                      color: WCSColors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: WCSSpacing.sm,
                  ),
                  _HybridCameraPermissionGuide(l10n: l10n),
                  const SizedBox(
                    height: WCSSpacing.md,
                  ),
                  Text(
                    'l10n.cameraAccessDeniedDescAndAction',
                    style: WCSTextStyle.bodyText1.copyWith(
                      color: WCSColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HybridCameraPermissionGuide extends StatelessWidget {
  const _HybridCameraPermissionGuide({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenMeasurements(context).screenWidth;
    final screenHeight = ScreenMeasurements(context).screenHeight;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Platform.isAndroid) ...[
          Text(
            'l10n.clickEnableCameraAccessButton',
            style: WCSTextStyle.overline.copyWith(
              color: WCSColors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: WCSSpacing.sm,
            ),
            child: Text(
              'l10n.clickOnPermissions',
              style: WCSTextStyle.overline.copyWith(
                color: WCSColors.grey,
              ),
            ),
          ),
          Assets.images.androidCameraSetting1.image(
            height: screenHeight * 0.14,
            width: screenWidth,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: WCSSpacing.sm,
            ),
            child: Text(
              'l10n.tapOnCameraPermissionInNotAllowedSection',
              style: WCSTextStyle.overline.copyWith(
                color: WCSColors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: WCSSpacing.sm,
          ),
          Assets.images.androidCameraSetting2.image(
            height: screenHeight * 0.14,
            width: screenWidth,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: WCSSpacing.sm,
            ),
            child: Text(
              'l10n.selectPermissionTypeAccordingly',
              style: WCSTextStyle.overline.copyWith(
                color: WCSColors.grey,
              ),
            ),
          ),
          Assets.images.androidCameraSetting3.image(
            height: screenHeight * 0.25,
            width: screenWidth,
          ),
        ] else if (Platform.isIOS) ...[
          Assets.images.iosCameraSetting.image(
            height: screenHeight * 0.2,
            width: screenWidth,
          ),
        ]
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    required this.context,
    required this.l10n,
  });

  final BuildContext context;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return WCSBottomNavigationBar(
      child: WCSElevatedButton.primary(
        onPressed: () async => openAppSettings(),
        child: Text(
          'l10n.enableCameraAccess',
          style: WCSTextStyle.bodyText1.copyWith(
            color: WCSColors.white,
          ),
        ),
      ),
    );
  }
}
