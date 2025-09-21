import 'package:dartz/dartz.dart';
import 'package:playground_bloc/features/reimbursment/data/datasources/reimbursment_remote_data_source.dart';
import 'package:playground_bloc/features/reimbursment/data/models/bosses/bosses_model.dart';
import 'package:playground_bloc/features/reimbursment/data/models/types/types_model.dart';
import 'package:playground_bloc/features/reimbursment/domain/entities/bosses/bosses_entity.dart';
import 'package:playground_bloc/features/reimbursment/domain/entities/types/types_entity.dart';

import '../../domain/repositories/reimbursment_repository.dart';

class ReimbursmentRepositoryImpl implements ReimbursmentRepository {
  final ReimbursmentRemoteDataSource _remoteDataSource;

  ReimbursmentRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<String, List<TypesEntity>>> getDataReimbursmentTypes() async {
    try {
      final List<TypesModel> models =
          await _remoteDataSource.getDataReimburstmentTypes();

      final entities = models
          .map(
            (model) =>
                TypesEntity(id: model.id, description: model.description),
          )
          .toList(growable: false);
      return Right(entities);
    } catch (e) {
      return Left('Failed to get reimbursment: $e');
    }
  }

  @override
  Future<Either<String, List<BossesEntity>>>
  getDataReimburstmentBosses() async {
    try {
      final List<BossesModel> models =
          await _remoteDataSource.getDataReimburstmentBosses();

      final entities = models
          .map(
            (model) => BossesEntity(
              name: model.name,
              role: model.role,
              status: model.status,
              date: model.date,
              avatarUrl: model.avatarUrl,
            ),
          )
          .toList(growable: false);
      return Right(entities);
    } catch (e) {
      return Left('Failed to get reimbursment: $e');
    }
  }
}
