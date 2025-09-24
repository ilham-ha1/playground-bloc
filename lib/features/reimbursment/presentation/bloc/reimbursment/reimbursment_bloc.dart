import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_bloc/features/reimbursment/domain/usecases/get_bosses_use_case.dart';
import 'package:playground_bloc/features/reimbursment/domain/usecases/get_types_use_case.dart';

import 'reimbursment_event.dart';
import 'reimbursment_state.dart';

export 'reimbursment_event.dart';
export 'reimbursment_state.dart';

class ReimbursmentBloc extends Bloc<ReimbursmentEvent, ReimbursmentState> {
  final GetTypesUsecase _getTypes;
  final GetBossesUsecase _getBosses;

  ReimbursmentBloc({
    required GetTypesUsecase getTypes,
    required GetBossesUsecase getBosses,
  }) : _getTypes = getTypes,
       _getBosses = getBosses,
       super(const ReimbursmentState()) {
    on<ReimbursmentLoadTypesRequested>(_onLoadTypes);
    on<ReimbursmentLoadBossesRequested>(_onLoadBosses);
    on<ReimbursmentLoadAllRequested>(_onLoadAll);
    on<ReimbursmentDateSelected>(_onDateSelected);
    on<ReimbursmentDateCleared>(_onDateCleared);
    on<ReimbursmentClaimSelected>(_onClaimSelected);
    on<ReimbursmentDetailTextChanged>(_onDetailTextChanged);
    on<ReimbursmentImagesAdded>(_addImage);
    on<ReimbursmentImageRemovedAt>(_removeImageAt);
    on<ReimbursmentImagesCleared>(_removeAllImages);
    on<ReimbursmentNominalChanged>(_onChangedNominal);
    on<ReimbursmentInformationChanged>(_onChangedInformation);
    on<ReimbursmentSaveEvidence>(_saveEvidence);
    on<ReimbursmentListEvidenceRemovedAt>(_removeEvidanceAt);
    on<ReimbursmentEvidenceEditingStarted>(_onEvidenceEditingStarted);
    on<ReimbursmentEvidenceFormReset>(_onEvidenceFormReset);
  }

  void _removeEvidanceAt(
    ReimbursmentListEvidenceRemovedAt event,
    Emitter<ReimbursmentState> emit,
  ) {
    if (event.index < 0) return;
    final updated = List<Evidence>.from(state.evidences)..removeAt(event.index);
    int? editingIndex = state.editingEvidenceIndex;

    if (editingIndex != null) {
      if (event.index == editingIndex) {
        editingIndex = null;
      } else if (event.index < editingIndex) {
        editingIndex -= 1;
      }
    }

    emit(
      state.copyWith(evidences: updated, editingEvidenceIndex: editingIndex),
    );
  }

  void _saveEvidence(
    ReimbursmentSaveEvidence event,
    Emitter<ReimbursmentState> emit,
  ) {
    final updated = List<Evidence>.from(state.evidences);
    final evidence = Evidence(
      information: event.information,
      nominal: event.nominal,
      newImages: List<PickedImage>.from(event.newImages),
    );

    final editingIndex = state.editingEvidenceIndex;
    if (editingIndex != null &&
        editingIndex >= 0 &&
        editingIndex < updated.length) {
      updated[editingIndex] = evidence;
    } else {
      updated.add(evidence);
    }

    emit(
      state.copyWith(
        evidences: updated,
        images: <PickedImage>[],
        nominalText: null,
        informationText: null,
        editingEvidenceIndex: null,
      ),
    );
  }

  void _onEvidenceEditingStarted(
    ReimbursmentEvidenceEditingStarted event,
    Emitter<ReimbursmentState> emit,
  ) {
    if (event.index < 0 || event.index >= state.evidences.length) return;
    final evidence = state.evidences[event.index];

    emit(
      state.copyWith(
        editingEvidenceIndex: event.index,
        nominalText: evidence.nominal ?? '',
        informationText: evidence.information ?? '',
        images: List<PickedImage>.from(
          evidence.newImages ?? const <PickedImage>[],
        ),
      ),
    );
  }

  void _onEvidenceFormReset(
    ReimbursmentEvidenceFormReset event,
    Emitter<ReimbursmentState> emit,
  ) {
    emit(
      state.copyWith(
        editingEvidenceIndex: null,
        images: <PickedImage>[],
        nominalText: null,
        informationText: null,
      ),
    );
  }

  void _onChangedInformation(
    ReimbursmentInformationChanged event,
    Emitter<ReimbursmentState> emit,
  ) {
    emit(state.copyWith(informationText: event.information));
  }

  void _onChangedNominal(
    ReimbursmentNominalChanged event,
    Emitter<ReimbursmentState> emit,
  ) {
    emit(state.copyWith(nominalText: event.nominal));
  }

  void _removeAllImages(
    ReimbursmentImagesCleared event,
    Emitter<ReimbursmentState> emit,
  ) {
    emit(state.copyWith(images: <PickedImage>[]));
  }

  void _addImage(
    ReimbursmentImagesAdded event,
    Emitter<ReimbursmentState> emit,
  ) {
    final updated = List<PickedImage>.from(state.images)
      ..addAll(event.newImages);

    emit(state.copyWith(images: updated));
  }

  void _removeImageAt(
    ReimbursmentImageRemovedAt event,
    Emitter<ReimbursmentState> emit,
  ) {
    if (event.index < 0 || event.index >= state.images.length) return;
    final updated = List<PickedImage>.from(state.images)..removeAt(event.index);
    emit(state.copyWith(images: updated));
  }

  void _onDetailTextChanged(
    ReimbursmentDetailTextChanged event,
    Emitter<ReimbursmentState> emit,
  ) {
    emit(state.copyWith(detailText: event.text));
  }

  void _onClaimSelected(
    ReimbursmentClaimSelected event,
    Emitter<ReimbursmentState> emit,
  ) {
    emit(state.copyWith(selectedClaimId: event.selectedTypeId));
  }

  Future<void> _onLoadTypes(
    ReimbursmentLoadTypesRequested event,
    Emitter<ReimbursmentState> emit,
  ) async {
    emit(
      state.copyWith(
        typesStatus: ReimbursmentLoadStatus.loading,
        typesErrorMessage: null,
      ),
    );

    final result = await _getTypes();
    result.fold(
      (failure) => emit(
        state.copyWith(
          typesStatus: ReimbursmentLoadStatus.failure,
          typesErrorMessage: failure,
        ),
      ),
      (types) => emit(
        state.copyWith(
          typesStatus: ReimbursmentLoadStatus.success,
          types: types,
          typesErrorMessage: null,
        ),
      ),
    );
  }

  Future<void> _onLoadBosses(
    ReimbursmentLoadBossesRequested event,
    Emitter<ReimbursmentState> emit,
  ) async {
    emit(
      state.copyWith(
        bossesStatus: ReimbursmentLoadStatus.loading,
        bossesErrorMessage: null,
      ),
    );

    final result = await _getBosses();
    result.fold(
      (failure) => emit(
        state.copyWith(
          bossesStatus: ReimbursmentLoadStatus.failure,
          bossesErrorMessage: failure,
        ),
      ),
      (bosses) => emit(
        state.copyWith(
          bossesStatus: ReimbursmentLoadStatus.success,
          bosses: bosses,
          bossesErrorMessage: null,
        ),
      ),
    );
  }

  Future<void> _onLoadAll(
    ReimbursmentLoadAllRequested event,
    Emitter<ReimbursmentState> emit,
  ) async {
    add(const ReimbursmentLoadTypesRequested());
    add(const ReimbursmentLoadBossesRequested());
  }

  void _onDateSelected(
    ReimbursmentDateSelected event,
    Emitter<ReimbursmentState> emit,
  ) {
    emit(state.copyWith(selectedDate: event.selectedDate));
  }

  void _onDateCleared(
    ReimbursmentDateCleared event,
    Emitter<ReimbursmentState> emit,
  ) {
    emit(state.copyWith(selectedDate: null));
  }
}
