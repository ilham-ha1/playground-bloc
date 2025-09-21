// To parse this JSON data, do
//
//     final typesEntity = typesEntityFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'types_entity.freezed.dart';
part 'types_entity.g.dart';

List<TypesEntity> typesEntityFromJson(String str) => List<TypesEntity>.from(
  json.decode(str).map((x) => TypesEntity.fromJson(x)),
);

String typesEntityToJson(List<TypesEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class TypesEntity with _$TypesEntity {
  const factory TypesEntity({String? id, String? description}) = _TypesEntity;

  factory TypesEntity.fromJson(Map<String, dynamic> json) =>
      _$TypesEntityFromJson(json);
}
