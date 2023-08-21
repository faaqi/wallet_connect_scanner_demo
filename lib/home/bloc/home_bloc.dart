import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_connect_repository/wallet_connect_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required WalletConnectRepository walletConnectRepository,
  })  : _walletConnectRepository = walletConnectRepository,
        super(const HomeState.initial()) {
    on<PairWithWalletConnectRequested>(_onPairWithWalletConnectRequested);
  }

  final WalletConnectRepository _walletConnectRepository;

  Future<void> _onPairWithWalletConnectRequested(
    PairWithWalletConnectRequested event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          qrCodeURI: event.qrCodeURI,
          status: HomeStatus.loading,
        ),
      );

      final pairingInfo = await _walletConnectRepository.pairWithWalletConnect(
        uri: event.qrCodeURI,
      );

      emit(
        state.copyWith(
          pairingInfo: pairingInfo,
          status: HomeStatus.loaded,
        ),
      );
    } on Exception catch (_) {}
  }
}
