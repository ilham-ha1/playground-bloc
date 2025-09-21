// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'types_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TypesModel {

 String? get id; String? get description;
/// Create a copy of TypesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TypesModelCopyWith<TypesModel> get copyWith => _$TypesModelCopyWithImpl<TypesModel>(this as TypesModel, _$identity);

  /// Serializes this TypesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypesModel&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description);

@override
String toString() {
  return 'TypesModel(id: $id, description: $description)';
}


}

/// @nodoc
abstract mixin class $TypesModelCopyWith<$Res>  {
  factory $TypesModelCopyWith(TypesModel value, $Res Function(TypesModel) _then) = _$TypesModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? description
});




}
/// @nodoc
class _$TypesModelCopyWithImpl<$Res>
    implements $TypesModelCopyWith<$Res> {
  _$TypesModelCopyWithImpl(this._self, this._then);

  final TypesModel _self;
  final $Res Function(TypesModel) _then;

/// Create a copy of TypesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TypesModel].
extension TypesModelPatterns on TypesModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TypesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TypesModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TypesModel value)  $default,){
final _that = this;
switch (_that) {
case _TypesModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TypesModel value)?  $default,){
final _that = this;
switch (_that) {
case _TypesModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TypesModel() when $default != null:
return $default(_that.id,_that.description);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? description)  $default,) {final _that = this;
switch (_that) {
case _TypesModel():
return $default(_that.id,_that.description);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _TypesModel() when $default != null:
return $default(_that.id,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TypesModel implements TypesModel {
  const _TypesModel({this.id, this.description});
  factory _TypesModel.fromJson(Map<String, dynamic> json) => _$TypesModelFromJson(json);

@override final  String? id;
@override final  String? description;

/// Create a copy of TypesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TypesModelCopyWith<_TypesModel> get copyWith => __$TypesModelCopyWithImpl<_TypesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TypesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TypesModel&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description);

@override
String toString() {
  return 'TypesModel(id: $id, description: $description)';
}


}

/// @nodoc
abstract mixin class _$TypesModelCopyWith<$Res> implements $TypesModelCopyWith<$Res> {
  factory _$TypesModelCopyWith(_TypesModel value, $Res Function(_TypesModel) _then) = __$TypesModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? description
});




}
/// @nodoc
class __$TypesModelCopyWithImpl<$Res>
    implements _$TypesModelCopyWith<$Res> {
  __$TypesModelCopyWithImpl(this._self, this._then);

  final _TypesModel _self;
  final $Res Function(_TypesModel) _then;

/// Create a copy of TypesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? description = freezed,}) {
  return _then(_TypesModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
