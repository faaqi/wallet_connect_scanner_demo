part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  const HomeState({
    required this.status,
    this.qrCodeURI = '',
    this.pairingInfo,
  });

  const HomeState.initial()
      : this(
          status: HomeStatus.initial,
        );

  final HomeStatus status;
  final String qrCodeURI;
  final PairingInfo? pairingInfo;

  HomeState copyWith({
    HomeStatus? status,
    String? qrCodeURI,
    PairingInfo? pairingInfo,
  }) {
    return HomeState(
      status: status ?? this.status,
      qrCodeURI: qrCodeURI ?? this.qrCodeURI,
      pairingInfo: pairingInfo ?? this.pairingInfo,
    );
  }

  @override
  List<Object?> get props => [
        status,
        qrCodeURI,
        pairingInfo,
      ];
}
