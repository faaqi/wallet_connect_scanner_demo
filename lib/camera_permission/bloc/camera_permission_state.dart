part of 'camera_permission_bloc.dart';

enum CameraPermissionStatus {
  initial,
  loading,
  success,
  error,
}

enum CameraPermissionError {
  generic,
  showSettingPermissionDenied,
  openAppSettings,
}

enum CameraPermissionRequestedFrom {
  generic,
  createMerchantWallet,
  sendPayment,
  settingTakeAPicture,
  scanQRCodeOfReceiverWalletAddress,
}

class CameraPermissionState extends Equatable {
  const CameraPermissionState({
    required this.status,
    this.cameraPermissionError,
    this.cameraPermissionRequestedFrom = CameraPermissionRequestedFrom.generic,
  });

  const CameraPermissionState.initial()
      : this(
          status: CameraPermissionStatus.initial,
          cameraPermissionError: CameraPermissionError.generic,
        );

  final CameraPermissionStatus status;
  final CameraPermissionRequestedFrom cameraPermissionRequestedFrom;
  final CameraPermissionError? cameraPermissionError;

  CameraPermissionState copyWith({
    CameraPermissionStatus? status,
    CameraPermissionRequestedFrom? cameraPermissionRequestedFrom,
    CameraPermissionError? cameraPermissionError,
  }) {
    return CameraPermissionState(
      status: status ?? this.status,
      cameraPermissionRequestedFrom:
          cameraPermissionRequestedFrom ?? this.cameraPermissionRequestedFrom,
      cameraPermissionError:
          cameraPermissionError ?? this.cameraPermissionError,
    );
  }

  @override
  List<Object?> get props => [
        status,
        cameraPermissionRequestedFrom,
        cameraPermissionError,
      ];
}
