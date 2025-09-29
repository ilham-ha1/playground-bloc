// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'take_pic_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TakePicState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TakePicState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TakePicState()';
}


}

/// @nodoc
class $TakePicStateCopyWith<$Res>  {
$TakePicStateCopyWith(TakePicState _, $Res Function(TakePicState) __);
}


/// Adds pattern-matching-related methods to [TakePicState].
extension TakePicStatePatterns on TakePicState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CamInitializing value)?  camInitializing,TResult Function( CamReady value)?  camReady,TResult Function( CamCaptured value)?  camCaptured,TResult Function( CamPermissionDenied value)?  camPermissionDenied,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CamInitializing() when camInitializing != null:
return camInitializing(_that);case CamReady() when camReady != null:
return camReady(_that);case CamCaptured() when camCaptured != null:
return camCaptured(_that);case CamPermissionDenied() when camPermissionDenied != null:
return camPermissionDenied(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CamInitializing value)  camInitializing,required TResult Function( CamReady value)  camReady,required TResult Function( CamCaptured value)  camCaptured,required TResult Function( CamPermissionDenied value)  camPermissionDenied,}){
final _that = this;
switch (_that) {
case CamInitializing():
return camInitializing(_that);case CamReady():
return camReady(_that);case CamCaptured():
return camCaptured(_that);case CamPermissionDenied():
return camPermissionDenied(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CamInitializing value)?  camInitializing,TResult? Function( CamReady value)?  camReady,TResult? Function( CamCaptured value)?  camCaptured,TResult? Function( CamPermissionDenied value)?  camPermissionDenied,}){
final _that = this;
switch (_that) {
case CamInitializing() when camInitializing != null:
return camInitializing(_that);case CamReady() when camReady != null:
return camReady(_that);case CamCaptured() when camCaptured != null:
return camCaptured(_that);case CamPermissionDenied() when camPermissionDenied != null:
return camPermissionDenied(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  camInitializing,TResult Function( CameraLensDirection lens,  bool busy)?  camReady,TResult Function( List<String> path)?  camCaptured,TResult Function( bool permanently)?  camPermissionDenied,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CamInitializing() when camInitializing != null:
return camInitializing();case CamReady() when camReady != null:
return camReady(_that.lens,_that.busy);case CamCaptured() when camCaptured != null:
return camCaptured(_that.path);case CamPermissionDenied() when camPermissionDenied != null:
return camPermissionDenied(_that.permanently);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  camInitializing,required TResult Function( CameraLensDirection lens,  bool busy)  camReady,required TResult Function( List<String> path)  camCaptured,required TResult Function( bool permanently)  camPermissionDenied,}) {final _that = this;
switch (_that) {
case CamInitializing():
return camInitializing();case CamReady():
return camReady(_that.lens,_that.busy);case CamCaptured():
return camCaptured(_that.path);case CamPermissionDenied():
return camPermissionDenied(_that.permanently);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  camInitializing,TResult? Function( CameraLensDirection lens,  bool busy)?  camReady,TResult? Function( List<String> path)?  camCaptured,TResult? Function( bool permanently)?  camPermissionDenied,}) {final _that = this;
switch (_that) {
case CamInitializing() when camInitializing != null:
return camInitializing();case CamReady() when camReady != null:
return camReady(_that.lens,_that.busy);case CamCaptured() when camCaptured != null:
return camCaptured(_that.path);case CamPermissionDenied() when camPermissionDenied != null:
return camPermissionDenied(_that.permanently);case _:
  return null;

}
}

}

/// @nodoc


class CamInitializing implements TakePicState {
  const CamInitializing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CamInitializing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TakePicState.camInitializing()';
}


}




/// @nodoc


class CamReady implements TakePicState {
  const CamReady({required this.lens, this.busy = false});
  

 final  CameraLensDirection lens;
@JsonKey() final  bool busy;

/// Create a copy of TakePicState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CamReadyCopyWith<CamReady> get copyWith => _$CamReadyCopyWithImpl<CamReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CamReady&&(identical(other.lens, lens) || other.lens == lens)&&(identical(other.busy, busy) || other.busy == busy));
}


@override
int get hashCode => Object.hash(runtimeType,lens,busy);

@override
String toString() {
  return 'TakePicState.camReady(lens: $lens, busy: $busy)';
}


}

/// @nodoc
abstract mixin class $CamReadyCopyWith<$Res> implements $TakePicStateCopyWith<$Res> {
  factory $CamReadyCopyWith(CamReady value, $Res Function(CamReady) _then) = _$CamReadyCopyWithImpl;
@useResult
$Res call({
 CameraLensDirection lens, bool busy
});




}
/// @nodoc
class _$CamReadyCopyWithImpl<$Res>
    implements $CamReadyCopyWith<$Res> {
  _$CamReadyCopyWithImpl(this._self, this._then);

  final CamReady _self;
  final $Res Function(CamReady) _then;

/// Create a copy of TakePicState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lens = null,Object? busy = null,}) {
  return _then(CamReady(
lens: null == lens ? _self.lens : lens // ignore: cast_nullable_to_non_nullable
as CameraLensDirection,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class CamCaptured implements TakePicState {
  const CamCaptured({required final  List<String> path}): _path = path;
  

 final  List<String> _path;
 List<String> get path {
  if (_path is EqualUnmodifiableListView) return _path;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_path);
}


/// Create a copy of TakePicState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CamCapturedCopyWith<CamCaptured> get copyWith => _$CamCapturedCopyWithImpl<CamCaptured>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CamCaptured&&const DeepCollectionEquality().equals(other._path, _path));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_path));

@override
String toString() {
  return 'TakePicState.camCaptured(path: $path)';
}


}

/// @nodoc
abstract mixin class $CamCapturedCopyWith<$Res> implements $TakePicStateCopyWith<$Res> {
  factory $CamCapturedCopyWith(CamCaptured value, $Res Function(CamCaptured) _then) = _$CamCapturedCopyWithImpl;
@useResult
$Res call({
 List<String> path
});




}
/// @nodoc
class _$CamCapturedCopyWithImpl<$Res>
    implements $CamCapturedCopyWith<$Res> {
  _$CamCapturedCopyWithImpl(this._self, this._then);

  final CamCaptured _self;
  final $Res Function(CamCaptured) _then;

/// Create a copy of TakePicState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(CamCaptured(
path: null == path ? _self._path : path // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class CamPermissionDenied implements TakePicState {
  const CamPermissionDenied({required this.permanently});
  

 final  bool permanently;

/// Create a copy of TakePicState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CamPermissionDeniedCopyWith<CamPermissionDenied> get copyWith => _$CamPermissionDeniedCopyWithImpl<CamPermissionDenied>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CamPermissionDenied&&(identical(other.permanently, permanently) || other.permanently == permanently));
}


@override
int get hashCode => Object.hash(runtimeType,permanently);

@override
String toString() {
  return 'TakePicState.camPermissionDenied(permanently: $permanently)';
}


}

/// @nodoc
abstract mixin class $CamPermissionDeniedCopyWith<$Res> implements $TakePicStateCopyWith<$Res> {
  factory $CamPermissionDeniedCopyWith(CamPermissionDenied value, $Res Function(CamPermissionDenied) _then) = _$CamPermissionDeniedCopyWithImpl;
@useResult
$Res call({
 bool permanently
});




}
/// @nodoc
class _$CamPermissionDeniedCopyWithImpl<$Res>
    implements $CamPermissionDeniedCopyWith<$Res> {
  _$CamPermissionDeniedCopyWithImpl(this._self, this._then);

  final CamPermissionDenied _self;
  final $Res Function(CamPermissionDenied) _then;

/// Create a copy of TakePicState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? permanently = null,}) {
  return _then(CamPermissionDenied(
permanently: null == permanently ? _self.permanently : permanently // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
