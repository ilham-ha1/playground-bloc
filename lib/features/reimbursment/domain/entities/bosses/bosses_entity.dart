// To parse this JSON data, do
//
//     final bossesEntity = bossesEntityFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bosses_entity.freezed.dart';
part 'bosses_entity.g.dart';

List<BossesEntity> bossesEntityFromJson(String str) => List<BossesEntity>.from(
  json.decode(str).map((x) => BossesEntity.fromJson(x)),
);

String bossesEntityToJson(List<BossesEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class BossesEntity with _$BossesEntity {
  const factory BossesEntity({
    String? name,
    String? role,
    String? status,
    DateTime? date,
    String? avatarUrl,
  }) = _BossesEntity;

  factory BossesEntity.fromJson(Map<String, dynamic> json) =>
      _$BossesEntityFromJson(json);
}
