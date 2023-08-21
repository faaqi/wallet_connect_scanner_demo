import 'package:wallet_connect_repository/wallet_connect_repository.dart';

class WalletConnectRepository implements WalletConnectRepositoryBase {
  WalletConnectRepository({
    required this.walletConnectProjectID,
  });

  final String walletConnectProjectID;

  @override
  Future<PairingInfo> pairWithWalletConnect({required String uri}) async {
    final web3Wallet = await Web3Wallet.createInstance(
      projectId: walletConnectProjectID,
      metadata: const PairingMetadata(
        name: 'WalletConnect Scanner Demo',
        description: 'QR Code Scanner for WalletConnect',
        url: 'https://walletconnect.com',
        icons: ['https://avatars.githubusercontent.com/u/37784886'],
      ),
    );

    final data = await web3Wallet.pair(uri: Uri.parse(uri));
    return data;
  }
}
