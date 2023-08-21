import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_connect_repository/wallet_connect_repository.dart';
import 'package:wallet_connect_scanner_demo/camera_permission/bloc/camera_permission_bloc.dart';
import 'package:wallet_connect_scanner_demo/home/home.dart';

import 'package:wallet_connect_scanner_demo/l10n/l10n.dart';
import 'package:wallet_connect_scanner_ui/wallet_connect_scanner_ui.dart';

class App extends StatelessWidget {
  const App({
    required WalletConnectRepository walletConnectRepository,
    super.key,
  }) : _walletConnectRepository = walletConnectRepository;

  final WalletConnectRepository _walletConnectRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => _walletConnectRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (_) => HomeBloc(
              walletConnectRepository: _walletConnectRepository,
            ),
          ),
          BlocProvider(
            create: (_) => CameraPermissionBloc(),
          ),
        ],
        child: MaterialApp(
          theme: WCSTheme().lightTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          debugShowCheckedModeBanner: false,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const HomeView(),
        ),
      ),
    );
  }
}
