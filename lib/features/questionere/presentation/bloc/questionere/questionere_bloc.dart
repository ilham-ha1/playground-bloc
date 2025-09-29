import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'questionere_event.dart';
import 'questionere_state.dart';

class QuestionereBloc extends Bloc<QuestionereEvent, QuestionereState> {
  QuestionereBloc() : super(const QuestionereState.initial()) {
    on<QuestionereInit>(_loadData);
    on<QuestionereInitCamera>(_initCamera);
    on<QuestionereAddPhoto>(_addPhoto);
  }

  FutureOr<void> _loadData(
    QuestionereInit event,
    Emitter<QuestionereState> emit,
  ) async {
    emit(const QuestionereState.loading());
    await Future.delayed(const Duration(milliseconds: 300));
    emit(
      QuestionereState.loaded(photos: kDummyPhotos, capturedPaths: const []),
    );
  }

  FutureOr<void> _initCamera(
    QuestionereInitCamera event,
    Emitter<QuestionereState> emit,
  ) async {}

  FutureOr<void> _addPhoto(
    QuestionereAddPhoto event,
    Emitter<QuestionereState> emit,
  ) {
    state.maybeMap(
      loaded: (s) {
        final updated = List<String>.from(s.capturedPaths)..add(event.path);
        emit(s.copyWith(capturedPaths: updated));
      },
      orElse: () {},
    );
  }
}
