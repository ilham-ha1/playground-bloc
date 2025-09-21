import 'package:equatable/equatable.dart';

abstract class TypesEvent extends Equatable {
  const TypesEvent();

  @override
  List<Object?> get props => [];
}

class LoadTypes extends TypesEvent {}
