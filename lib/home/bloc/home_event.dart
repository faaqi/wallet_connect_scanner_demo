part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class PairWithWalletConnectRequested extends HomeEvent {
  const PairWithWalletConnectRequested({required this.qrCodeURI});

  final String qrCodeURI;

  @override
  List<Object?> get props => [qrCodeURI];
}
