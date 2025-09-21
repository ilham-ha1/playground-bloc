// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bosses_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BossesEntity {

 String? get name; String? get role; String? get status; DateTime? get date; String? get avatarUrl;
/// Create a copy of BossesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BossesEntityCopyWith<BossesEntity> get copyWith => _$BossesEntityCopyWithImpl<BossesEntity>(this as BossesEntity, _$identity);

  /// Serializes this BossesEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BossesEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.date, date) || other.date == date)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,role,status,date,avatarUrl);

@override
String toString() {
  return 'BossesEntity(name: $name, role: $role, status: $status, date: $date, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $BossesEntityCopyWith<$Res>  {
  factory $BossesEntityCopyWith(BossesEntity value, $Res Function(BossesEntity) _then) = _$BossesEntityCopyWithImpl;
@useResult
$Res call({
 String? name, String? role, String? status, DateTime? date, String? avatarUrl
});




}
/// @nodoc
class _$BossesEntityCopyWithImpl<$Res>
    implements $BossesEntityCopyWith<$Res> {
  _$BossesEntityCopyWithImpl(this._self, this._then);

  final BossesEntity _self;
  final $Res Function(BossesEntity) _then;

/// Create a copy of BossesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? role = freezed,Object? status = freezed,Object? date = freezed,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BossesEntity].
extension BossesEntityPatterns on BossesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BossesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BossesEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BossesEntity value)  $default,){
final _that = this;
switch (_that) {
case _BossesEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BossesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BossesEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? role,  String? status,  DateTime? date,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BossesEntity() when $default != null:
return $default(_that.name,_that.role,_that.status,_that.date,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? role,  String? status,  DateTime? date,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _BossesEntity():
return $default(_that.name,_that.role,_that.status,_that.date,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? role,  String? status,  DateTime? date,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _BossesEntity() when $default != null:
return $default(_that.name,_that.role,_that.status,_that.date,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BossesEntity implements BossesEntity {
  const _BossesEntity({this.name, this.role, this.status, this.date, this.avatarUrl});
  factory _BossesEntity.fromJson(Map<String, dynamic> json) => _$BossesEntityFromJson(json);

@override final  String? name;
@override final  String? role;
@override final  String? status;
@override final  DateTime? date;
@override final  String? avatarUrl;

/// Create a copy of BossesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BossesEntityCopyWith<_BossesEntity> get copyWith => __$BossesEntityCopyWithImpl<_BossesEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BossesEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BossesEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.date, date) || other.date == date)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,role,status,date,avatarUrl);

@override
String toString() {
  return 'BossesEntity(name: $name, role: $role, status: $status, date: $date, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$BossesEntityCopyWith<$Res> implements $BossesEntityCopyWith<$Res> {
  factory _$BossesEntityCopyWith(_BossesEntity value, $Res Function(_BossesEntity) _then) = __$BossesEntityCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? role, String? status, DateTime? date, String? avatarUrl
});




}
/// @nodoc
class __$BossesEntityCopyWithImpl<$Res>
    implements _$BossesEntityCopyWith<$Res> {
  __$BossesEntityCopyWithImpl(this._self, this._then);

  final _BossesEntity _self;
  final $Res Function(_BossesEntity) _then;

/// Create a copy of BossesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? role = freezed,Object? status = freezed,Object? date = freezed,Object? avatarUrl = freezed,}) {
  return _then(_BossesEntity(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
