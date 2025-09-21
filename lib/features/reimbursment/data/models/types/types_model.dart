// To parse this JSON data, do
//
//     final typesModel = typesModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'types_model.freezed.dart';
part 'types_model.g.dart';

List<TypesModel> typesModelFromJson(String str) => List<TypesModel>.from(json.decode(str).map((x) => TypesModel.fromJson(x)));

String typesModelToJson(List<TypesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class TypesModel with _$TypesModel {
    const factory TypesModel({
        String? id,
        String? description,
    }) = _TypesModel;

    factory TypesModel.fromJson(Map<String, dynamic> json) => _$TypesModelFromJson(json);
}
