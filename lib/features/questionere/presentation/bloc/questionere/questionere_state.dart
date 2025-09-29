import 'package:freezed_annotation/freezed_annotation.dart';

part 'questionere_state.freezed.dart';

@freezed
abstract class QuestionerePhoto with _$QuestionerePhoto {
  const factory QuestionerePhoto({required String url, required String name}) =
      _QuestionerePhoto;
}

@freezed
sealed class QuestionereState with _$QuestionereState {
  // Base
  const factory QuestionereState.initial() = QuestionereInitial;
  const factory QuestionereState.loading() = QuestionereLoading;
  const factory QuestionereState.loaded({
    required List<QuestionerePhoto> photos,
    required List<String> capturedPaths,
  }) = QuestionereLoaded;
  const factory QuestionereState.error(String message) = QuestionereError;
  const factory QuestionereState.success(String message) = QuestionereSuccess;
}

const List<QuestionerePhoto> kDummyPhotos = [
  QuestionerePhoto(
    url:
        'https://archives.bulbagarden.net/media/upload/c/c5/Pok%C3%A9mon_Card_GB_Final_Tactical_Book.png',
    name: 'Foto Depan',
  ),
  QuestionerePhoto(
    url:
        'https://archives.bulbagarden.net/media/upload/c/c5/Pok%C3%A9mon_Card_GB_Final_Tactical_Book.png',
    name: 'Foto Kanan',
  ),
  QuestionerePhoto(
    url:
        'https://archives.bulbagarden.net/media/upload/c/c5/Pok%C3%A9mon_Card_GB_Final_Tactical_Book.png',
    name: 'Foto Kiri',
  ),
];
