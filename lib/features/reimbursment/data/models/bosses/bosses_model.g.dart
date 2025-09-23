// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bosses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BossesModel _$BossesModelFromJson(Map<String, dynamic> json) => _BossesModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  role: json['role'] as String?,
  status: json['status'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  avatarUrl: json['avatarUrl'] as String?,
);

Map<String, dynamic> _$BossesModelToJson(_BossesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'status': instance.status,
      'date': instance.date?.toIso8601String(),
      'avatarUrl': instance.avatarUrl,
    };
