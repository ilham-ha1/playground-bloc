import 'package:equatable/equatable.dart';
import 'package:playground_bloc/features/reimbursment/domain/entities/types/types_entity.dart';

abstract class TypesState extends Equatable {
  const TypesState();

  @override
  List<Object?> get props => [];
}

//HIT ENDPOINT GET REIMBURSTMENT TYPE
class TypesInitial extends TypesState {}

class TypesLoading extends TypesState {}

class TypesLoaded extends TypesState {
  final List<TypesEntity> types;

  const TypesLoaded(this.types);

  @override
  List<Object?> get props => [types];
}

class TypesError extends TypesState {
  final String message;

  const TypesError(this.message);

  @override
  List<Object?> get props => [message];
}

class TypesSuccess extends TypesState {
  final String message;

  const TypesSuccess(this.message);

  @override
  List<Object?> get props => [message];
}
