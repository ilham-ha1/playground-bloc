// To parse this JSON data, do
//
//     final bossesModel = bossesModelFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bosses_model.freezed.dart';
part 'bosses_model.g.dart';

List<BossesModel> bossesModelFromJson(String str) => List<BossesModel>.from(
  json.decode(str).map((x) => BossesModel.fromJson(x)),
);

String bossesModelToJson(List<BossesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class BossesModel with _$BossesModel {
  const factory BossesModel({
    String? name,
    String? role,
    String? status,
    DateTime? date,
    String? avatarUrl,
  }) = _BossesModel;

  factory BossesModel.fromJson(Map<String, dynamic> json) =>
      _$BossesModelFromJson(json);
}
