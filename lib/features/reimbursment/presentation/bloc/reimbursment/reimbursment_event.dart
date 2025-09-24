import 'package:equatable/equatable.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/reimbursment/reimbursment_bloc.dart';

abstract class ReimbursmentEvent extends Equatable {
  const ReimbursmentEvent();

  @override
  List<Object?> get props => [];
}

class ReimbursmentLoadTypesRequested extends ReimbursmentEvent {
  const ReimbursmentLoadTypesRequested();
}

class ReimbursmentLoadBossesRequested extends ReimbursmentEvent {
  const ReimbursmentLoadBossesRequested();
}

class ReimbursmentLoadAllRequested extends ReimbursmentEvent {
  const ReimbursmentLoadAllRequested();
}

class ReimbursmentDateSelected extends ReimbursmentEvent {
  const ReimbursmentDateSelected(this.selectedDate);

  final DateTime selectedDate;

  @override
  List<Object?> get props => [selectedDate];
}

class ReimbursmentDateCleared extends ReimbursmentEvent {
  const ReimbursmentDateCleared();
}

class ReimbursmentClaimSelected extends ReimbursmentEvent {
  const ReimbursmentClaimSelected(this.selectedTypeId);

  final String selectedTypeId;

  @override
  List<Object?> get props => [selectedTypeId];
}

class ReimbursmentDetailTextChanged extends ReimbursmentEvent {
  const ReimbursmentDetailTextChanged(this.text);

  final String text;

  @override
  List<Object?> get props => [text];
}

class ReimbursmentImagesAdded extends ReimbursmentEvent {
  const ReimbursmentImagesAdded(this.newImages);

  final List<PickedImage> newImages;

  @override
  List<Object?> get props => [newImages];
}

class ReimbursmentImageRemovedAt extends ReimbursmentEvent {
  const ReimbursmentImageRemovedAt(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

class ReimbursmentImagesCleared extends ReimbursmentEvent {
  const ReimbursmentImagesCleared();
}

class ReimbursmentNominalChanged extends ReimbursmentEvent {
  const ReimbursmentNominalChanged(this.nominal);

  final String nominal;

  @override
  List<Object?> get props => [nominal];
}

class ReimbursmentInformationChanged extends ReimbursmentEvent {
  const ReimbursmentInformationChanged(this.information);

  final String information;

  @override
  List<Object?> get props => [information];
}

class ReimbursmentEvidenceEditingStarted extends ReimbursmentEvent {
  const ReimbursmentEvidenceEditingStarted(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

class ReimbursmentEvidenceFormReset extends ReimbursmentEvent {
  const ReimbursmentEvidenceFormReset();
}

class ReimbursmentSaveEvidence extends ReimbursmentEvent {
  const ReimbursmentSaveEvidence(
    this.information,
    this.nominal,
    this.newImages,
  );

  final String nominal;
  final String information;
  final List<PickedImage> newImages;

  @override
  List<Object?> get props => [nominal, information, newImages];
}

class ReimbursmentListEvidenceRemovedAt extends ReimbursmentEvent {
  const ReimbursmentListEvidenceRemovedAt(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}
