import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:playground_bloc/features/reimbursment/domain/entities/bosses/bosses_entity.dart';
import 'package:playground_bloc/features/reimbursment/domain/entities/types/types_entity.dart';

enum ReimbursmentLoadStatus { initial, loading, success, failure }

const _noChange = Object();

class ReimbursmentState extends Equatable {
  const ReimbursmentState({
    this.typesStatus = ReimbursmentLoadStatus.initial,
    this.bossesStatus = ReimbursmentLoadStatus.initial,
    this.types = const [],
    this.bosses = const [],
    this.typesErrorMessage,
    this.bossesErrorMessage,
    this.selectedDate,
    this.selectedClaimId,
    this.detailText,
    this.nominalText,
    this.informationText,
    this.images = const <PickedImage>[],
    this.evidences = const <Evidence>[],
    this.editingEvidenceIndex,
  });

  final ReimbursmentLoadStatus typesStatus;
  final ReimbursmentLoadStatus bossesStatus;
  final List<TypesEntity> types;
  final List<BossesEntity> bosses;
  final String? typesErrorMessage;
  final String? bossesErrorMessage;
  final DateTime? selectedDate;
  final String? selectedClaimId;
  final String? detailText;
  final String? nominalText;
  final String? informationText;
  final List<PickedImage> images;
  final List<Evidence> evidences;
  final int? editingEvidenceIndex;

  ReimbursmentState copyWith({
    ReimbursmentLoadStatus? typesStatus,
    ReimbursmentLoadStatus? bossesStatus,
    List<TypesEntity>? types,
    List<BossesEntity>? bosses,
    Object? typesErrorMessage = _noChange,
    Object? bossesErrorMessage = _noChange,
    Object? selectedDate = _noChange,
    Object? selectedClaimId = _noChange,
    Object? detailText = _noChange,
    Object? nominalText = _noChange,
    Object? informationText = _noChange,
    Object? images = _noChange,
    Object? evidences = _noChange,
    Object? editingEvidenceIndex = _noChange,
  }) {
    return ReimbursmentState(
      typesStatus: typesStatus ?? this.typesStatus,
      bossesStatus: bossesStatus ?? this.bossesStatus,
      types: types ?? this.types,
      bosses: bosses ?? this.bosses,
      typesErrorMessage:
          typesErrorMessage == _noChange
              ? this.typesErrorMessage
              : typesErrorMessage as String?,
      bossesErrorMessage:
          bossesErrorMessage == _noChange
              ? this.bossesErrorMessage
              : bossesErrorMessage as String?,
      selectedDate:
          selectedDate == _noChange
              ? this.selectedDate
              : selectedDate as DateTime?,
      selectedClaimId:
          selectedClaimId == _noChange
              ? this.selectedClaimId
              : selectedClaimId as String?,
      detailText:
          detailText == _noChange ? this.detailText : detailText as String?,
      nominalText:
          nominalText == _noChange ? this.nominalText : nominalText as String?,
      informationText:
          informationText == _noChange
              ? this.informationText
              : informationText as String?,
      images: images == _noChange ? this.images : (images as List<PickedImage>),
      evidences:
          evidences == _noChange
              ? this.evidences
              : (evidences as List<Evidence>),
      editingEvidenceIndex:
          editingEvidenceIndex == _noChange
              ? this.editingEvidenceIndex
              : editingEvidenceIndex as int?,
    );
  }

  @override
  List<Object?> get props => [
    typesStatus,
    bossesStatus,
    types,
    bosses,
    typesErrorMessage,
    bossesErrorMessage,
    selectedDate,
    selectedClaimId,
    detailText,
    nominalText,
    images,
    informationText,
    evidences,
    editingEvidenceIndex,
  ];
}

class PickedImage extends Equatable {
  final String? path;
  final Uint8List? bytes;
  final String? name;
  final int? size;

  const PickedImage({this.path, this.bytes, this.name, this.size});

  @override
  List<Object?> get props => [path, bytes, name, size];
}

class Evidence extends Equatable {
  final String? nominal;
  final String? information;
  final List<PickedImage>? newImages;

  const Evidence({this.information, this.nominal, this.newImages});

  @override
  List<Object?> get props => [information, nominal, newImages];
}
