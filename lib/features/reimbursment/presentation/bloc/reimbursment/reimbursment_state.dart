import 'package:equatable/equatable.dart';

abstract class ReimbursmentState extends Equatable {
  const ReimbursmentState();

  @override
  List<Object?> get props => [];
}

class ReimbursmentInitial extends ReimbursmentState {}
