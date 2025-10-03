// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StudentDto {

 int? get id; String get name; double get marks; bool get status; DateTime? get createdAt; Grade get grade;
/// Create a copy of StudentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentDtoCopyWith<StudentDto> get copyWith => _$StudentDtoCopyWithImpl<StudentDto>(this as StudentDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.marks, marks) || other.marks == marks)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.grade, grade) || other.grade == grade));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,marks,status,createdAt,grade);

@override
String toString() {
  return 'StudentDto(id: $id, name: $name, marks: $marks, status: $status, createdAt: $createdAt, grade: $grade)';
}


}

/// @nodoc
abstract mixin class $StudentDtoCopyWith<$Res>  {
  factory $StudentDtoCopyWith(StudentDto value, $Res Function(StudentDto) _then) = _$StudentDtoCopyWithImpl;
@useResult
$Res call({
 int? id, String name, double marks, bool status, DateTime? createdAt, Grade grade
});




}
/// @nodoc
class _$StudentDtoCopyWithImpl<$Res>
    implements $StudentDtoCopyWith<$Res> {
  _$StudentDtoCopyWithImpl(this._self, this._then);

  final StudentDto _self;
  final $Res Function(StudentDto) _then;

/// Create a copy of StudentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? marks = null,Object? status = null,Object? createdAt = freezed,Object? grade = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,marks: null == marks ? _self.marks : marks // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentDto].
extension StudentDtoPatterns on StudentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentDto value)  $default,){
final _that = this;
switch (_that) {
case _StudentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentDto value)?  $default,){
final _that = this;
switch (_that) {
case _StudentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String name,  double marks,  bool status,  DateTime? createdAt,  Grade grade)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentDto() when $default != null:
return $default(_that.id,_that.name,_that.marks,_that.status,_that.createdAt,_that.grade);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String name,  double marks,  bool status,  DateTime? createdAt,  Grade grade)  $default,) {final _that = this;
switch (_that) {
case _StudentDto():
return $default(_that.id,_that.name,_that.marks,_that.status,_that.createdAt,_that.grade);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String name,  double marks,  bool status,  DateTime? createdAt,  Grade grade)?  $default,) {final _that = this;
switch (_that) {
case _StudentDto() when $default != null:
return $default(_that.id,_that.name,_that.marks,_that.status,_that.createdAt,_that.grade);case _:
  return null;

}
}

}

/// @nodoc


class _StudentDto extends StudentDto {
  const _StudentDto({this.id, required this.name, required this.marks, required this.status, this.createdAt, required this.grade}): super._();
  

@override final  int? id;
@override final  String name;
@override final  double marks;
@override final  bool status;
@override final  DateTime? createdAt;
@override final  Grade grade;

/// Create a copy of StudentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentDtoCopyWith<_StudentDto> get copyWith => __$StudentDtoCopyWithImpl<_StudentDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.marks, marks) || other.marks == marks)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.grade, grade) || other.grade == grade));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,marks,status,createdAt,grade);

@override
String toString() {
  return 'StudentDto(id: $id, name: $name, marks: $marks, status: $status, createdAt: $createdAt, grade: $grade)';
}


}

/// @nodoc
abstract mixin class _$StudentDtoCopyWith<$Res> implements $StudentDtoCopyWith<$Res> {
  factory _$StudentDtoCopyWith(_StudentDto value, $Res Function(_StudentDto) _then) = __$StudentDtoCopyWithImpl;
@override @useResult
$Res call({
 int? id, String name, double marks, bool status, DateTime? createdAt, Grade grade
});




}
/// @nodoc
class __$StudentDtoCopyWithImpl<$Res>
    implements _$StudentDtoCopyWith<$Res> {
  __$StudentDtoCopyWithImpl(this._self, this._then);

  final _StudentDto _self;
  final $Res Function(_StudentDto) _then;

/// Create a copy of StudentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? marks = null,Object? status = null,Object? createdAt = freezed,Object? grade = null,}) {
  return _then(_StudentDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,marks: null == marks ? _self.marks : marks // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade,
  ));
}


}

// dart format on
