import 'package:dartz/dartz.dart';
import 'package:playground_bloc/features/reimbursment/domain/entities/bosses/bosses_entity.dart';
import 'package:playground_bloc/features/reimbursment/domain/entities/types/types_entity.dart';

abstract class ReimbursmentRepository {
  Future<Either<String, List<TypesEntity>>> getDataReimbursmentTypes();
  Future<Either<String, List<BossesEntity>>> getDataReimburstmentBosses();
}
