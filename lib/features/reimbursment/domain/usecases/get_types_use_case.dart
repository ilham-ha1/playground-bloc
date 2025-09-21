import 'package:dartz/dartz.dart';
import 'package:playground_bloc/features/reimbursment/domain/entities/types/types_entity.dart';
import 'package:playground_bloc/features/reimbursment/domain/repositories/reimbursment_repository.dart';

class GetTypesUsecase {
  final ReimbursmentRepository repository;

  GetTypesUsecase(this.repository);

  Future<Either<String, List<TypesEntity>>> call() async {
    return repository.getDataReimbursmentTypes();
  }
}
