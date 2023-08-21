import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:wallet_connect_repository/wallet_connect_repository.dart';
import 'package:wallet_connect_scanner_demo/app/view/app.dart';
import 'package:wallet_connect_scanner_demo/env/env.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  final walletConnectRepository = WalletConnectRepository(
    walletConnectProjectID: Env.walletConnectProjectID,
  );

  // Add cross-flavor configuration here

  runApp(App(walletConnectRepository: walletConnectRepository));
}
