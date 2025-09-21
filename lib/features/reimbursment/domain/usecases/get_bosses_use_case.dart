import 'package:dartz/dartz.dart';
import 'package:playground_bloc/features/reimbursment/domain/entities/bosses/bosses_entity.dart';
import 'package:playground_bloc/features/reimbursment/domain/repositories/reimbursment_repository.dart';

class GetBossesUsecase {
  final ReimbursmentRepository repository;

  GetBossesUsecase(this.repository);

  Future<Either<String, List<BossesEntity>>> call() async {
    return repository.getDataReimburstmentBosses();
  }
}
