import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wallet_connect_repository/wallet_connect_repository.dart';
import 'package:wallet_connect_scanner_demo/camera_permission/bloc/camera_permission_bloc.dart';
import 'package:wallet_connect_scanner_demo/home/home.dart';
import 'package:wallet_connect_scanner_demo/l10n/l10n.dart';
import 'package:wallet_connect_scanner_demo/scan_qr_code/scan_qr_code.dart';
import 'package:wallet_connect_scanner_ui/wallet_connect_scanner_ui.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isLoading = context
        .select((HomeBloc bloc) => bloc.state.status == HomeStatus.loading);
    final pairingInfo =
        context.select((HomeBloc bloc) => bloc.state.pairingInfo);

    return BlocListener<CameraPermissionBloc, CameraPermissionState>(
      listener: (_, state) {
        if (state.status == CameraPermissionStatus.success) {
          Navigator.push(
            context,
            ScanQRCodeView.route(
              onQRCodeDetected: (val) {
                context.read<HomeBloc>().add(
                      PairWithWalletConnectRequested(
                        qrCodeURI: val,
                      ),
                    );
              },
            ),
          );
        }
      },
      child: WCSSafeArea(
        color: WCSColors.brightGrey,
        child: WCSProgressIndicator(
          isLoading: isLoading,
          child: Scaffold(
            appBar: WCSAppBar.primary(
              backgroundColor: WCSColors.brightGrey,
              titleText: l10n.walletConnectDemo,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: WCSSpacing.lg,
              ),
              child: Column(
                children: [
                  if (pairingInfo == null) ...[_InitialView(l10n: l10n)] else
                    _PairingInfoView(
                      pairingInfo: pairingInfo,
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

class _PairingInfoView extends StatelessWidget {
  const _PairingInfoView({
    required this.pairingInfo,
  });

  final PairingInfo pairingInfo;

  @override
  Widget build(BuildContext context) {
    final qrCodeURI = context.read<HomeBloc>().state.qrCodeURI;
    return Flexible(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: WCSSpacing.lg,
        ),
        shrinkWrap: true,
        children: [
          Card(
            color: WCSColors.brightGrey,
            child: Column(
              children: [
                ListTile(
                  leading: Text(
                    'QR Code URI',
                    style: WCSTextStyle.caption,
                  ),
                  title: Text(
                    qrCodeURI,
                    style: WCSTextStyle.caption,
                  ),
                ),
                ListTile(
                  leading: Text(
                    'Topic',
                    style: WCSTextStyle.caption,
                  ),
                  title: Text(
                    pairingInfo.topic,
                    style: WCSTextStyle.caption,
                  ),
                ),
                ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Expiry',
                        style: WCSTextStyle.caption,
                      ),
                    ],
                  ),
                  title: Text(
                    DateFormat.yMMMd().format(
                      DateTime.fromMillisecondsSinceEpoch(
                        pairingInfo.expiry,
                      ),
                    ),
                    style: WCSTextStyle.caption,
                  ),
                ),
                ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Relay Protocol',
                        style: WCSTextStyle.caption,
                      ),
                    ],
                  ),
                  title: Text(
                    pairingInfo.relay.protocol,
                    style: WCSTextStyle.caption,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InitialView extends StatelessWidget {
  const _InitialView({
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Center(child: Text(l10n.scanWalletConnectQRCode)),
          const Spacer(),
          WCSElevatedButton.primary(
            onPressed: () {
              context
                  .read<CameraPermissionBloc>()
                  .add(const CheckCameraPermission());
            },
            child: Text(l10n.scanQRCode),
          ),
        ],
      ),
    );
  }
}
