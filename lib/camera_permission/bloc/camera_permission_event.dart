part of 'camera_permission_bloc.dart';

abstract class CameraPermissionEvent extends Equatable {
  const CameraPermissionEvent();

  @override
  List<Object?> get props => [];
}

class CheckCameraPermission extends CameraPermissionEvent {
  const CheckCameraPermission({
    this.cameraPermissionRequestedFrom,
  });

  final CameraPermissionRequestedFrom? cameraPermissionRequestedFrom;

  @override
  List<Object?> get props => [cameraPermissionRequestedFrom];
}

class ResetCameraPermission extends CameraPermissionEvent {}
