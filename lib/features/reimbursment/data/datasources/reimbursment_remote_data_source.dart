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
      {
        "id": "1",
        "name": "Ilham Hakim",
        "role": "CEO",
        "status": "waiting",
        "date": null,
        "avatarUrl":
            "https://intentplanning.ca/wp-content/uploads/2019/01/sample-person.jpg",
      },
      {
        "id": "2",
        "name": "Nurul Choiriyah",
        "role": "CTO",
        "status": "rejected",
        "date": "2025-09-01T09:30:00.000Z",
        "avatarUrl":
            "https://intentplanning.ca/wp-content/uploads/2019/01/sample-person.jpg",
      },
      {
        "id": "3",
        "name": "Budi Santoso",
        "role": "Project Manager",
        "status": "accepted",
        "date": "2025-08-15T14:45:00.000Z",
        "avatarUrl":
            "https://intentplanning.ca/wp-content/uploads/2019/01/sample-person.jpg",
      },
    ];

    return dummyData
        .map((json) => BossesModel.fromJson(json))
        .toList(growable: false);
  }
}
