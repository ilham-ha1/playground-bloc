// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questionere_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuestionereEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionereEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuestionereEvent()';
}


}

/// @nodoc
class $QuestionereEventCopyWith<$Res>  {
$QuestionereEventCopyWith(QuestionereEvent _, $Res Function(QuestionereEvent) __);
}


/// Adds pattern-matching-related methods to [QuestionereEvent].
extension QuestionereEventPatterns on QuestionereEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( QuestionereInit value)?  init,TResult Function( QuestionereRequestPermission value)?  requestPermission,TResult Function( QuestionereInitCamera value)?  initCamera,TResult Function( QuestionereSwitchLens value)?  switchLens,TResult Function( QuestionereTakePicture value)?  takePicture,TResult Function( QuestionereAddPhoto value)?  addPhoto,TResult Function( QuestionereErrorCleared value)?  errorCleared,required TResult orElse(),}){
final _that = this;
switch (_that) {
case QuestionereInit() when init != null:
return init(_that);case QuestionereRequestPermission() when requestPermission != null:
return requestPermission(_that);case QuestionereInitCamera() when initCamera != null:
return initCamera(_that);case QuestionereSwitchLens() when switchLens != null:
return switchLens(_that);case QuestionereTakePicture() when takePicture != null:
return takePicture(_that);case QuestionereAddPhoto() when addPhoto != null:
return addPhoto(_that);case QuestionereErrorCleared() when errorCleared != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( QuestionereInit value)  init,required TResult Function( QuestionereRequestPermission value)  requestPermission,required TResult Function( QuestionereInitCamera value)  initCamera,required TResult Function( QuestionereSwitchLens value)  switchLens,required TResult Function( QuestionereTakePicture value)  takePicture,required TResult Function( QuestionereAddPhoto value)  addPhoto,required TResult Function( QuestionereErrorCleared value)  errorCleared,}){
final _that = this;
switch (_that) {
case QuestionereInit():
return init(_that);case QuestionereRequestPermission():
return requestPermission(_that);case QuestionereInitCamera():
return initCamera(_that);case QuestionereSwitchLens():
return switchLens(_that);case QuestionereTakePicture():
return takePicture(_that);case QuestionereAddPhoto():
return addPhoto(_that);case QuestionereErrorCleared():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( QuestionereInit value)?  init,TResult? Function( QuestionereRequestPermission value)?  requestPermission,TResult? Function( QuestionereInitCamera value)?  initCamera,TResult? Function( QuestionereSwitchLens value)?  switchLens,TResult? Function( QuestionereTakePicture value)?  takePicture,TResult? Function( QuestionereAddPhoto value)?  addPhoto,TResult? Function( QuestionereErrorCleared value)?  errorCleared,}){
final _that = this;
switch (_that) {
case QuestionereInit() when init != null:
return init(_that);case QuestionereRequestPermission() when requestPermission != null:
return requestPermission(_that);case QuestionereInitCamera() when initCamera != null:
return initCamera(_that);case QuestionereSwitchLens() when switchLens != null:
return switchLens(_that);case QuestionereTakePicture() when takePicture != null:
return takePicture(_that);case QuestionereAddPhoto() when addPhoto != null:
return addPhoto(_that);case QuestionereErrorCleared() when errorCleared != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  requestPermission,TResult Function( CameraLensDirection lens)?  initCamera,TResult Function()?  switchLens,TResult Function()?  takePicture,TResult Function( String path)?  addPhoto,TResult Function()?  errorCleared,required TResult orElse(),}) {final _that = this;
switch (_that) {
case QuestionereInit() when init != null:
return init();case QuestionereRequestPermission() when requestPermission != null:
return requestPermission();case QuestionereInitCamera() when initCamera != null:
return initCamera(_that.lens);case QuestionereSwitchLens() when switchLens != null:
return switchLens();case QuestionereTakePicture() when takePicture != null:
return takePicture();case QuestionereAddPhoto() when addPhoto != null:
return addPhoto(_that.path);case QuestionereErrorCleared() when errorCleared != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  requestPermission,required TResult Function( CameraLensDirection lens)  initCamera,required TResult Function()  switchLens,required TResult Function()  takePicture,required TResult Function( String path)  addPhoto,required TResult Function()  errorCleared,}) {final _that = this;
switch (_that) {
case QuestionereInit():
return init();case QuestionereRequestPermission():
return requestPermission();case QuestionereInitCamera():
return initCamera(_that.lens);case QuestionereSwitchLens():
return switchLens();case QuestionereTakePicture():
return takePicture();case QuestionereAddPhoto():
return addPhoto(_that.path);case QuestionereErrorCleared():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  requestPermission,TResult? Function( CameraLensDirection lens)?  initCamera,TResult? Function()?  switchLens,TResult? Function()?  takePicture,TResult? Function( String path)?  addPhoto,TResult? Function()?  errorCleared,}) {final _that = this;
switch (_that) {
case QuestionereInit() when init != null:
return init();case QuestionereRequestPermission() when requestPermission != null:
return requestPermission();case QuestionereInitCamera() when initCamera != null:
return initCamera(_that.lens);case QuestionereSwitchLens() when switchLens != null:
return switchLens();case QuestionereTakePicture() when takePicture != null:
return takePicture();case QuestionereAddPhoto() when addPhoto != null:
return addPhoto(_that.path);case QuestionereErrorCleared() when errorCleared != null:
return errorCleared();case _:
  return null;

}
}

}

/// @nodoc


class QuestionereInit implements QuestionereEvent {
  const QuestionereInit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionereInit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuestionereEvent.init()';
}


}




/// @nodoc


class QuestionereRequestPermission implements QuestionereEvent {
  const QuestionereRequestPermission();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionereRequestPermission);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuestionereEvent.requestPermission()';
}


}




/// @nodoc


class QuestionereInitCamera implements QuestionereEvent {
  const QuestionereInitCamera({required this.lens});
  

 final  CameraLensDirection lens;

/// Create a copy of QuestionereEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionereInitCameraCopyWith<QuestionereInitCamera> get copyWith => _$QuestionereInitCameraCopyWithImpl<QuestionereInitCamera>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionereInitCamera&&(identical(other.lens, lens) || other.lens == lens));
}


@override
int get hashCode => Object.hash(runtimeType,lens);

@override
String toString() {
  return 'QuestionereEvent.initCamera(lens: $lens)';
}


}

/// @nodoc
abstract mixin class $QuestionereInitCameraCopyWith<$Res> implements $QuestionereEventCopyWith<$Res> {
  factory $QuestionereInitCameraCopyWith(QuestionereInitCamera value, $Res Function(QuestionereInitCamera) _then) = _$QuestionereInitCameraCopyWithImpl;
@useResult
$Res call({
 CameraLensDirection lens
});




}
/// @nodoc
class _$QuestionereInitCameraCopyWithImpl<$Res>
    implements $QuestionereInitCameraCopyWith<$Res> {
  _$QuestionereInitCameraCopyWithImpl(this._self, this._then);

  final QuestionereInitCamera _self;
  final $Res Function(QuestionereInitCamera) _then;

/// Create a copy of QuestionereEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lens = null,}) {
  return _then(QuestionereInitCamera(
lens: null == lens ? _self.lens : lens // ignore: cast_nullable_to_non_nullable
as CameraLensDirection,
  ));
}


}

/// @nodoc


class QuestionereSwitchLens implements QuestionereEvent {
  const QuestionereSwitchLens();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionereSwitchLens);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuestionereEvent.switchLens()';
}


}




/// @nodoc


class QuestionereTakePicture implements QuestionereEvent {
  const QuestionereTakePicture();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionereTakePicture);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuestionereEvent.takePicture()';
}


}




/// @nodoc


class QuestionereAddPhoto implements QuestionereEvent {
  const QuestionereAddPhoto({required this.path});
  

 final  String path;

/// Create a copy of QuestionereEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionereAddPhotoCopyWith<QuestionereAddPhoto> get copyWith => _$QuestionereAddPhotoCopyWithImpl<QuestionereAddPhoto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionereAddPhoto&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'QuestionereEvent.addPhoto(path: $path)';
}


}

/// @nodoc
abstract mixin class $QuestionereAddPhotoCopyWith<$Res> implements $QuestionereEventCopyWith<$Res> {
  factory $QuestionereAddPhotoCopyWith(QuestionereAddPhoto value, $Res Function(QuestionereAddPhoto) _then) = _$QuestionereAddPhotoCopyWithImpl;
@useResult
$Res call({
 String path
});




}
/// @nodoc
class _$QuestionereAddPhotoCopyWithImpl<$Res>
    implements $QuestionereAddPhotoCopyWith<$Res> {
  _$QuestionereAddPhotoCopyWithImpl(this._self, this._then);

  final QuestionereAddPhoto _self;
  final $Res Function(QuestionereAddPhoto) _then;

/// Create a copy of QuestionereEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(QuestionereAddPhoto(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class QuestionereErrorCleared implements QuestionereEvent {
  const QuestionereErrorCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionereErrorCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuestionereEvent.errorCleared()';
}


}




// dart format on
