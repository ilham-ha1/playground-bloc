import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_bloc/features/reimbursment/domain/usecases/get_types_use_case.dart';

import 'types_event.dart';
import 'types_state.dart';

class TypesBloc extends Bloc<TypesEvent, TypesState> {
  //use case
  final GetTypesUsecase getTypes;

  TypesBloc({required this.getTypes}) : super(TypesInitial()) {
    on<LoadTypes>(_loadTypes);
  }

  Future<void> _loadTypes(LoadTypes event, Emitter<TypesState> emit) async {
    emit(TypesLoading());

    final result = await getTypes();
    result.fold(
      (failure) => emit(TypesError(failure)),
      (types) => emit(TypesLoaded(types)),
    );
  }
}
