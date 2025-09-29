import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'questionere_event.freezed.dart';

@freezed
sealed class QuestionereEvent with _$QuestionereEvent {
  // Questionere
  const factory QuestionereEvent.init() = QuestionereInit;

  // Camera
  const factory QuestionereEvent.requestPermission() =
      QuestionereRequestPermission;
  const factory QuestionereEvent.initCamera({
    required CameraLensDirection lens,
  }) = QuestionereInitCamera;
  const factory QuestionereEvent.switchLens() = QuestionereSwitchLens;
  const factory QuestionereEvent.takePicture() = QuestionereTakePicture;
  const factory QuestionereEvent.addPhoto({required String path}) =
      QuestionereAddPhoto;
  const factory QuestionereEvent.errorCleared() = QuestionereErrorCleared;
}
