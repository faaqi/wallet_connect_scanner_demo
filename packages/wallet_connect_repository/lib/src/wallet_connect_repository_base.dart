// ignore_for_file: one_member_abstracts

import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';

/// {@template wallet_connect_repository_base}
/// Repository for implementing the WalletConnect Methods
/// {@endtemplate}
///
abstract class WalletConnectRepositoryBase {
  Future<PairingInfo> pairWithWalletConnect({required String uri});
}
