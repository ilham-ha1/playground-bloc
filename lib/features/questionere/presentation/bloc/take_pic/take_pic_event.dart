import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'take_pic_event.freezed.dart';

@freezed
sealed class TakePicEvent with _$TakePicEvent {
  // Camera
  const factory TakePicEvent.requestPermission() = TakePicRequestPermission;
  const factory TakePicEvent.initCamera({required CameraLensDirection lens}) =
      TakePicInitCamera;
  const factory TakePicEvent.switchLens() = TakePicSwitchLens;
  const factory TakePicEvent.takePicture() = TakePicTakePicture;
  const factory TakePicEvent.errorCleared() = TakePicErrorCleared;
}
