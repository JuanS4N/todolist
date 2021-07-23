// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'list_of_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TaskListTearOff {
  const _$TaskListTearOff();

  _TaskList call(
      {required int listId, required String listName, required bool isActive}) {
    return _TaskList(
      listId: listId,
      listName: listName,
      isActive: isActive,
    );
  }
}

/// @nodoc
const $TaskList = _$TaskListTearOff();

/// @nodoc
mixin _$TaskList {
  int get listId => throw _privateConstructorUsedError;
  String get listName => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskListCopyWith<TaskList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskListCopyWith<$Res> {
  factory $TaskListCopyWith(TaskList value, $Res Function(TaskList) then) =
      _$TaskListCopyWithImpl<$Res>;
  $Res call({int listId, String listName, bool isActive});
}

/// @nodoc
class _$TaskListCopyWithImpl<$Res> implements $TaskListCopyWith<$Res> {
  _$TaskListCopyWithImpl(this._value, this._then);

  final TaskList _value;
  // ignore: unused_field
  final $Res Function(TaskList) _then;

  @override
  $Res call({
    Object? listId = freezed,
    Object? listName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_value.copyWith(
      listId: listId == freezed
          ? _value.listId
          : listId // ignore: cast_nullable_to_non_nullable
              as int,
      listName: listName == freezed
          ? _value.listName
          : listName // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TaskListCopyWith<$Res> implements $TaskListCopyWith<$Res> {
  factory _$TaskListCopyWith(_TaskList value, $Res Function(_TaskList) then) =
      __$TaskListCopyWithImpl<$Res>;
  @override
  $Res call({int listId, String listName, bool isActive});
}

/// @nodoc
class __$TaskListCopyWithImpl<$Res> extends _$TaskListCopyWithImpl<$Res>
    implements _$TaskListCopyWith<$Res> {
  __$TaskListCopyWithImpl(_TaskList _value, $Res Function(_TaskList) _then)
      : super(_value, (v) => _then(v as _TaskList));

  @override
  _TaskList get _value => super._value as _TaskList;

  @override
  $Res call({
    Object? listId = freezed,
    Object? listName = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_TaskList(
      listId: listId == freezed
          ? _value.listId
          : listId // ignore: cast_nullable_to_non_nullable
              as int,
      listName: listName == freezed
          ? _value.listName
          : listName // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TaskList with DiagnosticableTreeMixin implements _TaskList {
  _$_TaskList(
      {required this.listId, required this.listName, required this.isActive});

  @override
  final int listId;
  @override
  final String listName;
  @override
  final bool isActive;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TaskList(listId: $listId, listName: $listName, isActive: $isActive)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TaskList'))
      ..add(DiagnosticsProperty('listId', listId))
      ..add(DiagnosticsProperty('listName', listName))
      ..add(DiagnosticsProperty('isActive', isActive));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaskList &&
            (identical(other.listId, listId) ||
                const DeepCollectionEquality().equals(other.listId, listId)) &&
            (identical(other.listName, listName) ||
                const DeepCollectionEquality()
                    .equals(other.listName, listName)) &&
            (identical(other.isActive, isActive) ||
                const DeepCollectionEquality()
                    .equals(other.isActive, isActive)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(listId) ^
      const DeepCollectionEquality().hash(listName) ^
      const DeepCollectionEquality().hash(isActive);

  @JsonKey(ignore: true)
  @override
  _$TaskListCopyWith<_TaskList> get copyWith =>
      __$TaskListCopyWithImpl<_TaskList>(this, _$identity);
}

abstract class _TaskList implements TaskList {
  factory _TaskList(
      {required int listId,
      required String listName,
      required bool isActive}) = _$_TaskList;

  @override
  int get listId => throw _privateConstructorUsedError;
  @override
  String get listName => throw _privateConstructorUsedError;
  @override
  bool get isActive => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TaskListCopyWith<_TaskList> get copyWith =>
      throw _privateConstructorUsedError;
}
