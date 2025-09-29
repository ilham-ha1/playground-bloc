// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'questionere_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuestionerePhoto {

 String get url; String get name;
/// Create a copy of QuestionerePhoto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionerePhotoCopyWith<QuestionerePhoto> get copyWith => _$QuestionerePhotoCopyWithImpl<QuestionerePhoto>(this as QuestionerePhoto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionerePhoto&&(identical(other.url, url) || other.url == url)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,url,name);

@override
String toString() {
  return 'QuestionerePhoto(url: $url, name: $name)';
}


}

/// @nodoc
abstract mixin class $QuestionerePhotoCopyWith<$Res>  {
  factory $QuestionerePhotoCopyWith(QuestionerePhoto value, $Res Function(QuestionerePhoto) _then) = _$QuestionerePhotoCopyWithImpl;
@useResult
$Res call({
 String url, String name
});




}
/// @nodoc
class _$QuestionerePhotoCopyWithImpl<$Res>
    implements $QuestionerePhotoCopyWith<$Res> {
  _$QuestionerePhotoCopyWithImpl(this._self, this._then);

  final QuestionerePhoto _self;
  final $Res Function(QuestionerePhoto) _then;

/// Create a copy of QuestionerePhoto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? name = null,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionerePhoto].
extension QuestionerePhotoPatterns on QuestionerePhoto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionerePhoto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionerePhoto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionerePhoto value)  $default,){
final _that = this;
switch (_that) {
case _QuestionerePhoto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionerePhoto value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionerePhoto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionerePhoto() when $default != null:
return $default(_that.url,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url,  String name)  $default,) {final _that = this;
switch (_that) {
case _QuestionerePhoto():
return $default(_that.url,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url,  String name)?  $default,) {final _that = this;
switch (_that) {
case _QuestionerePhoto() when $default != null:
return $default(_that.url,_that.name);case _:
  return null;

}
}

}

/// @nodoc


class _QuestionerePhoto implements QuestionerePhoto {
  const _QuestionerePhoto({required this.url, required this.name});
  

@override final  String url;
@override final  String name;

/// Create a copy of QuestionerePhoto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionerePhotoCopyWith<_QuestionerePhoto> get copyWith => __$QuestionerePhotoCopyWithImpl<_QuestionerePhoto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionerePhoto&&(identical(other.url, url) || other.url == url)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,url,name);

@override
String toString() {
  return 'QuestionerePhoto(url: $url, name: $name)';
}


}

/// @nodoc
abstract mixin class _$QuestionerePhotoCopyWith<$Res> implements $QuestionerePhotoCopyWith<$Res> {
  factory _$QuestionerePhotoCopyWith(_QuestionerePhoto value, $Res Function(_QuestionerePhoto) _then) = __$QuestionerePhotoCopyWithImpl;
@override @useResult
$Res call({
 String url, String name
});




}
/// @nodoc
class __$QuestionerePhotoCopyWithImpl<$Res>
    implements _$QuestionerePhotoCopyWith<$Res> {
  __$QuestionerePhotoCopyWithImpl(this._self, this._then);

  final _QuestionerePhoto _self;
  final $Res Function(_QuestionerePhoto) _then;

/// Create a copy of QuestionerePhoto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? name = null,}) {
  return _then(_QuestionerePhoto(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$QuestionereState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionereState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuestionereState()';
}


}

/// @nodoc
class $QuestionereStateCopyWith<$Res>  {
$QuestionereStateCopyWith(QuestionereState _, $Res Function(QuestionereState) __);
}


/// Adds pattern-matching-related methods to [QuestionereState].
extension QuestionereStatePatterns on QuestionereState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( QuestionereInitial value)?  initial,TResult Function( QuestionereLoading value)?  loading,TResult Function( QuestionereLoaded value)?  loaded,TResult Function( QuestionereError value)?  error,TResult Function( QuestionereSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case QuestionereInitial() when initial != null:
return initial(_that);case QuestionereLoading() when loading != null:
return loading(_that);case QuestionereLoaded() when loaded != null:
return loaded(_that);case QuestionereError() when error != null:
return error(_that);case QuestionereSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( QuestionereInitial value)  initial,required TResult Function( QuestionereLoading value)  loading,required TResult Function( QuestionereLoaded value)  loaded,required TResult Function( QuestionereError value)  error,required TResult Function( QuestionereSuccess value)  success,}){
final _that = this;
switch (_that) {
case QuestionereInitial():
return initial(_that);case QuestionereLoading():
return loading(_that);case QuestionereLoaded():
return loaded(_that);case QuestionereError():
return error(_that);case QuestionereSuccess():
return success(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( QuestionereInitial value)?  initial,TResult? Function( QuestionereLoading value)?  loading,TResult? Function( QuestionereLoaded value)?  loaded,TResult? Function( QuestionereError value)?  error,TResult? Function( QuestionereSuccess value)?  success,}){
final _that = this;
switch (_that) {
case QuestionereInitial() when initial != null:
return initial(_that);case QuestionereLoading() when loading != null:
return loading(_that);case QuestionereLoaded() when loaded != null:
return loaded(_that);case QuestionereError() when error != null:
return error(_that);case QuestionereSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<QuestionerePhoto> photos,  List<String> capturedPaths)?  loaded,TResult Function( String message)?  error,TResult Function( String message)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case QuestionereInitial() when initial != null:
return initial();case QuestionereLoading() when loading != null:
return loading();case QuestionereLoaded() when loaded != null:
return loaded(_that.photos,_that.capturedPaths);case QuestionereError() when error != null:
return error(_that.message);case QuestionereSuccess() when success != null:
return success(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<QuestionerePhoto> photos,  List<String> capturedPaths)  loaded,required TResult Function( String message)  error,required TResult Function( String message)  success,}) {final _that = this;
switch (_that) {
case QuestionereInitial():
return initial();case QuestionereLoading():
return loading();case QuestionereLoaded():
return loaded(_that.photos,_that.capturedPaths);case QuestionereError():
return error(_that.message);case QuestionereSuccess():
return success(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<QuestionerePhoto> photos,  List<String> capturedPaths)?  loaded,TResult? Function( String message)?  error,TResult? Function( String message)?  success,}) {final _that = this;
switch (_that) {
case QuestionereInitial() when initial != null:
return initial();case QuestionereLoading() when loading != null:
return loading();case QuestionereLoaded() when loaded != null:
return loaded(_that.photos,_that.capturedPaths);case QuestionereError() when error != null:
return error(_that.message);case QuestionereSuccess() when success != null:
return success(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class QuestionereInitial implements QuestionereState {
  const QuestionereInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionereInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuestionereState.initial()';
}


}




/// @nodoc


class QuestionereLoading implements QuestionereState {
  const QuestionereLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionereLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'QuestionereState.loading()';
}


}




/// @nodoc


class QuestionereLoaded implements QuestionereState {
  const QuestionereLoaded({required final  List<QuestionerePhoto> photos, required final  List<String> capturedPaths}): _photos = photos,_capturedPaths = capturedPaths;
  

 final  List<QuestionerePhoto> _photos;
 List<QuestionerePhoto> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

 final  List<String> _capturedPaths;
 List<String> get capturedPaths {
  if (_capturedPaths is EqualUnmodifiableListView) return _capturedPaths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_capturedPaths);
}


/// Create a copy of QuestionereState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionereLoadedCopyWith<QuestionereLoaded> get copyWith => _$QuestionereLoadedCopyWithImpl<QuestionereLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionereLoaded&&const DeepCollectionEquality().equals(other._photos, _photos)&&const DeepCollectionEquality().equals(other._capturedPaths, _capturedPaths));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_photos),const DeepCollectionEquality().hash(_capturedPaths));

@override
String toString() {
  return 'QuestionereState.loaded(photos: $photos, capturedPaths: $capturedPaths)';
}


}

/// @nodoc
abstract mixin class $QuestionereLoadedCopyWith<$Res> implements $QuestionereStateCopyWith<$Res> {
  factory $QuestionereLoadedCopyWith(QuestionereLoaded value, $Res Function(QuestionereLoaded) _then) = _$QuestionereLoadedCopyWithImpl;
@useResult
$Res call({
 List<QuestionerePhoto> photos, List<String> capturedPaths
});




}
/// @nodoc
class _$QuestionereLoadedCopyWithImpl<$Res>
    implements $QuestionereLoadedCopyWith<$Res> {
  _$QuestionereLoadedCopyWithImpl(this._self, this._then);

  final QuestionereLoaded _self;
  final $Res Function(QuestionereLoaded) _then;

/// Create a copy of QuestionereState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? photos = null,Object? capturedPaths = null,}) {
  return _then(QuestionereLoaded(
photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<QuestionerePhoto>,capturedPaths: null == capturedPaths ? _self._capturedPaths : capturedPaths // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class QuestionereError implements QuestionereState {
  const QuestionereError(this.message);
  

 final  String message;

/// Create a copy of QuestionereState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionereErrorCopyWith<QuestionereError> get copyWith => _$QuestionereErrorCopyWithImpl<QuestionereError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionereError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'QuestionereState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $QuestionereErrorCopyWith<$Res> implements $QuestionereStateCopyWith<$Res> {
  factory $QuestionereErrorCopyWith(QuestionereError value, $Res Function(QuestionereError) _then) = _$QuestionereErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$QuestionereErrorCopyWithImpl<$Res>
    implements $QuestionereErrorCopyWith<$Res> {
  _$QuestionereErrorCopyWithImpl(this._self, this._then);

  final QuestionereError _self;
  final $Res Function(QuestionereError) _then;

/// Create a copy of QuestionereState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(QuestionereError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class QuestionereSuccess implements QuestionereState {
  const QuestionereSuccess(this.message);
  

 final  String message;

/// Create a copy of QuestionereState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionereSuccessCopyWith<QuestionereSuccess> get copyWith => _$QuestionereSuccessCopyWithImpl<QuestionereSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionereSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'QuestionereState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class $QuestionereSuccessCopyWith<$Res> implements $QuestionereStateCopyWith<$Res> {
  factory $QuestionereSuccessCopyWith(QuestionereSuccess value, $Res Function(QuestionereSuccess) _then) = _$QuestionereSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$QuestionereSuccessCopyWithImpl<$Res>
    implements $QuestionereSuccessCopyWith<$Res> {
  _$QuestionereSuccessCopyWithImpl(this._self, this._then);

  final QuestionereSuccess _self;
  final $Res Function(QuestionereSuccess) _then;

/// Create a copy of QuestionereState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(QuestionereSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
