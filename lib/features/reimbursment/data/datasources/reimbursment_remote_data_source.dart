import 'package:playground_bloc/features/reimbursment/data/models/bosses/bosses_model.dart';
import 'package:playground_bloc/features/reimbursment/data/models/types/types_model.dart';

abstract class ReimbursmentRemoteDataSource {
  Future<List<TypesModel>> getDataReimburstmentTypes();
  Future<List<BossesModel>> getDataReimburstmentBosses();
}

class ReimbursmentRemoteDataSourceImpl extends ReimbursmentRemoteDataSource {
  ReimbursmentRemoteDataSourceImpl();

  @override
  Future<List<TypesModel>> getDataReimburstmentTypes() async {
    const dummyData = [
      {'id': 'RBM-001', 'description': 'Taxi ride to client meeting'},
      {'id': 'RBM-002', 'description': 'Lunch with client'},
      {'id': 'RBM-003', 'description': 'Hotel stay for business trip'},
      {'id': 'RBM-004', 'description': 'Office supplies purchase'},
      {'id': 'RBM-005', 'description': 'Internet package reimbursement'},
    ];

    return dummyData
        .map((json) => TypesModel.fromJson(json))
        .toList(growable: false);
  }

  @override
  Future<List<BossesModel>> getDataReimburstmentBosses() async {
    const dummyData = [
      {'id': 'RBM-001', 'description': 'Taxi ride to client meeting'},
      {'id': 'RBM-002', 'description': 'Lunch with client'},
      {'id': 'RBM-003', 'description': 'Hotel stay for business trip'},
      {'id': 'RBM-004', 'description': 'Office supplies purchase'},
      {'id': 'RBM-005', 'description': 'Internet package reimbursement'},
    ];

    return dummyData
        .map((json) => BossesModel.fromJson(json))
        .toList(growable: false);
  }
}
