import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'take_pic_state.freezed.dart';


@freezed
sealed class TakePicState with _$TakePicState {
  // Camera flow
  const factory TakePicState.camInitializing() = CamInitializing;
  const factory TakePicState.camReady({
    required CameraLensDirection lens,
    @Default(false) bool busy,
  }) = CamReady;
  const factory TakePicState.camCaptured({required List<String> path}) =
      CamCaptured;
  const factory TakePicState.camPermissionDenied({required bool permanently}) =
      CamPermissionDenied;
}
