// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'take_pic_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TakePicEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TakePicEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TakePicEvent()';
}


}

/// @nodoc
class $TakePicEventCopyWith<$Res>  {
$TakePicEventCopyWith(TakePicEvent _, $Res Function(TakePicEvent) __);
}


/// Adds pattern-matching-related methods to [TakePicEvent].
extension TakePicEventPatterns on TakePicEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TakePicRequestPermission value)?  requestPermission,TResult Function( TakePicInitCamera value)?  initCamera,TResult Function( TakePicSwitchLens value)?  switchLens,TResult Function( TakePicTakePicture value)?  takePicture,TResult Function( TakePicAddPhoto value)?  addPhoto,TResult Function( TakePicErrorCleared value)?  errorCleared,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TakePicRequestPermission() when requestPermission != null:
return requestPermission(_that);case TakePicInitCamera() when initCamera != null:
return initCamera(_that);case TakePicSwitchLens() when switchLens != null:
return switchLens(_that);case TakePicTakePicture() when takePicture != null:
return takePicture(_that);case TakePicAddPhoto() when addPhoto != null:
return addPhoto(_that);case TakePicErrorCleared() when errorCleared != null:
return errorCleared(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TakePicRequestPermission value)  requestPermission,required TResult Function( TakePicInitCamera value)  initCamera,required TResult Function( TakePicSwitchLens value)  switchLens,required TResult Function( TakePicTakePicture value)  takePicture,required TResult Function( TakePicAddPhoto value)  addPhoto,required TResult Function( TakePicErrorCleared value)  errorCleared,}){
final _that = this;
switch (_that) {
case TakePicRequestPermission():
return requestPermission(_that);case TakePicInitCamera():
return initCamera(_that);case TakePicSwitchLens():
return switchLens(_that);case TakePicTakePicture():
return takePicture(_that);case TakePicAddPhoto():
return addPhoto(_that);case TakePicErrorCleared():
return errorCleared(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TakePicRequestPermission value)?  requestPermission,TResult? Function( TakePicInitCamera value)?  initCamera,TResult? Function( TakePicSwitchLens value)?  switchLens,TResult? Function( TakePicTakePicture value)?  takePicture,TResult? Function( TakePicAddPhoto value)?  addPhoto,TResult? Function( TakePicErrorCleared value)?  errorCleared,}){
final _that = this;
switch (_that) {
case TakePicRequestPermission() when requestPermission != null:
return requestPermission(_that);case TakePicInitCamera() when initCamera != null:
return initCamera(_that);case TakePicSwitchLens() when switchLens != null:
return switchLens(_that);case TakePicTakePicture() when takePicture != null:
return takePicture(_that);case TakePicAddPhoto() when addPhoto != null:
return addPhoto(_that);case TakePicErrorCleared() when errorCleared != null:
return errorCleared(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  requestPermission,TResult Function( CameraLensDirection lens)?  initCamera,TResult Function()?  switchLens,TResult Function()?  takePicture,TResult Function( String path)?  addPhoto,TResult Function()?  errorCleared,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TakePicRequestPermission() when requestPermission != null:
return requestPermission();case TakePicInitCamera() when initCamera != null:
return initCamera(_that.lens);case TakePicSwitchLens() when switchLens != null:
return switchLens();case TakePicTakePicture() when takePicture != null:
return takePicture();case TakePicAddPhoto() when addPhoto != null:
return addPhoto(_that.path);case TakePicErrorCleared() when errorCleared != null:
return errorCleared();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  requestPermission,required TResult Function( CameraLensDirection lens)  initCamera,required TResult Function()  switchLens,required TResult Function()  takePicture,required TResult Function( String path)  addPhoto,required TResult Function()  errorCleared,}) {final _that = this;
switch (_that) {
case TakePicRequestPermission():
return requestPermission();case TakePicInitCamera():
return initCamera(_that.lens);case TakePicSwitchLens():
return switchLens();case TakePicTakePicture():
return takePicture();case TakePicAddPhoto():
return addPhoto(_that.path);case TakePicErrorCleared():
return errorCleared();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  requestPermission,TResult? Function( CameraLensDirection lens)?  initCamera,TResult? Function()?  switchLens,TResult? Function()?  takePicture,TResult? Function( String path)?  addPhoto,TResult? Function()?  errorCleared,}) {final _that = this;
switch (_that) {
case TakePicRequestPermission() when requestPermission != null:
return requestPermission();case TakePicInitCamera() when initCamera != null:
return initCamera(_that.lens);case TakePicSwitchLens() when switchLens != null:
return switchLens();case TakePicTakePicture() when takePicture != null:
return takePicture();case TakePicAddPhoto() when addPhoto != null:
return addPhoto(_that.path);case TakePicErrorCleared() when errorCleared != null:
return errorCleared();case _:
  return null;

}
}

}

/// @nodoc


class TakePicRequestPermission implements TakePicEvent {
  const TakePicRequestPermission();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TakePicRequestPermission);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TakePicEvent.requestPermission()';
}


}




/// @nodoc


class TakePicInitCamera implements TakePicEvent {
  const TakePicInitCamera({required this.lens});
  

 final  CameraLensDirection lens;

/// Create a copy of TakePicEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TakePicInitCameraCopyWith<TakePicInitCamera> get copyWith => _$TakePicInitCameraCopyWithImpl<TakePicInitCamera>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TakePicInitCamera&&(identical(other.lens, lens) || other.lens == lens));
}


@override
int get hashCode => Object.hash(runtimeType,lens);

@override
String toString() {
  return 'TakePicEvent.initCamera(lens: $lens)';
}


}

/// @nodoc
abstract mixin class $TakePicInitCameraCopyWith<$Res> implements $TakePicEventCopyWith<$Res> {
  factory $TakePicInitCameraCopyWith(TakePicInitCamera value, $Res Function(TakePicInitCamera) _then) = _$TakePicInitCameraCopyWithImpl;
@useResult
$Res call({
 CameraLensDirection lens
});




}
/// @nodoc
class _$TakePicInitCameraCopyWithImpl<$Res>
    implements $TakePicInitCameraCopyWith<$Res> {
  _$TakePicInitCameraCopyWithImpl(this._self, this._then);

  final TakePicInitCamera _self;
  final $Res Function(TakePicInitCamera) _then;

/// Create a copy of TakePicEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lens = null,}) {
  return _then(TakePicInitCamera(
lens: null == lens ? _self.lens : lens // ignore: cast_nullable_to_non_nullable
as CameraLensDirection,
  ));
}


}

/// @nodoc


class TakePicSwitchLens implements TakePicEvent {
  const TakePicSwitchLens();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TakePicSwitchLens);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TakePicEvent.switchLens()';
}


}




/// @nodoc


class TakePicTakePicture implements TakePicEvent {
  const TakePicTakePicture();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TakePicTakePicture);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TakePicEvent.takePicture()';
}


}




/// @nodoc


class TakePicAddPhoto implements TakePicEvent {
  const TakePicAddPhoto({required this.path});
  

 final  String path;

/// Create a copy of TakePicEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TakePicAddPhotoCopyWith<TakePicAddPhoto> get copyWith => _$TakePicAddPhotoCopyWithImpl<TakePicAddPhoto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TakePicAddPhoto&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'TakePicEvent.addPhoto(path: $path)';
}


}

/// @nodoc
abstract mixin class $TakePicAddPhotoCopyWith<$Res> implements $TakePicEventCopyWith<$Res> {
  factory $TakePicAddPhotoCopyWith(TakePicAddPhoto value, $Res Function(TakePicAddPhoto) _then) = _$TakePicAddPhotoCopyWithImpl;
@useResult
$Res call({
 String path
});




}
/// @nodoc
class _$TakePicAddPhotoCopyWithImpl<$Res>
    implements $TakePicAddPhotoCopyWith<$Res> {
  _$TakePicAddPhotoCopyWithImpl(this._self, this._then);

  final TakePicAddPhoto _self;
  final $Res Function(TakePicAddPhoto) _then;

/// Create a copy of TakePicEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(TakePicAddPhoto(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TakePicErrorCleared implements TakePicEvent {
  const TakePicErrorCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TakePicErrorCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TakePicEvent.errorCleared()';
}


}




// dart format on
