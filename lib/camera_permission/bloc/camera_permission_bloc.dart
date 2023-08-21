import 'dart:io' show Platform;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'camera_permission_event.dart';
part 'camera_permission_state.dart';

class CameraPermissionBloc
    extends Bloc<CameraPermissionEvent, CameraPermissionState> {
  CameraPermissionBloc() : super(const CameraPermissionState.initial()) {
    on<CheckCameraPermission>(_onCheckCameraPermission);
    on<ResetCameraPermission>(_onResetCameraPermission);
  }

  Future<void> _onCheckCameraPermission(
    CheckCameraPermission event,
    Emitter<CameraPermissionState> emit,
  ) async {
    emit(
      state.copyWith(
        cameraPermissionRequestedFrom: event.cameraPermissionRequestedFrom ??
            state.cameraPermissionRequestedFrom,
        status: CameraPermissionStatus.initial,
      ),
    );

    /// check media settings permissions
    try {
      if (Platform.isIOS) {
        var permissionStatus = await Permission.camera.status;
        if (permissionStatus.isPermanentlyDenied || permissionStatus.isDenied) {
          permissionStatus = await Permission.camera.request();
        }
        if (!permissionStatus.isGranted && !permissionStatus.isLimited) {
          if (permissionStatus.isPermanentlyDenied) {
            emit(
              state.copyWith(
                cameraPermissionError:
                    CameraPermissionError.showSettingPermissionDenied,
                status: CameraPermissionStatus.error,
              ),
            );
            return;
          } else {
            return;
          }
        }
      } else if (Platform.isAndroid) {
        final permissionStatus = await Permission.camera.status;

        if (!permissionStatus.isLimited && !permissionStatus.isGranted) {
          if (_checkAndroidPermission(permissionStatus)) {
            emit(
              state.copyWith(
                cameraPermissionError:
                    CameraPermissionError.showSettingPermissionDenied,
                status: CameraPermissionStatus.error,
              ),
            );
            return;
          } else {
            final result = await Permission.camera.request();
            if (result.isPermanentlyDenied) {
              emit(
                state.copyWith(
                  cameraPermissionError:
                      CameraPermissionError.showSettingPermissionDenied,
                  status: CameraPermissionStatus.error,
                ),
              );
              return;
            } else if (!result.isGranted) {
              return;
            }
          }
        }
      }

      ///Permission Granted
      emit(
        state.copyWith(
          status: CameraPermissionStatus.success,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          status: CameraPermissionStatus.error,
          cameraPermissionError: CameraPermissionError.generic,
        ),
      );
    }
  }

  Future<void> _onResetCameraPermission(
    ResetCameraPermission event,
    Emitter<CameraPermissionState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CameraPermissionStatus.initial,
        cameraPermissionError: CameraPermissionError.generic,
      ),
    );
  }

  bool _checkAndroidPermission(PermissionStatus status) {
    return status.isPermanentlyDenied;
  }
}
