// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'database_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DatabaseFailureTearOff {
  const _$DatabaseFailureTearOff();

  ServerError serverError() {
    return const ServerError();
  }

  NoConnection noConnection() {
    return const NoConnection();
  }
}

/// @nodoc
const $DatabaseFailure = _$DatabaseFailureTearOff();

/// @nodoc
mixin _$DatabaseFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NoConnection value) noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NoConnection value)? noConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatabaseFailureCopyWith<$Res> {
  factory $DatabaseFailureCopyWith(
          DatabaseFailure value, $Res Function(DatabaseFailure) then) =
      _$DatabaseFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$DatabaseFailureCopyWithImpl<$Res>
    implements $DatabaseFailureCopyWith<$Res> {
  _$DatabaseFailureCopyWithImpl(this._value, this._then);

  final DatabaseFailure _value;
  // ignore: unused_field
  final $Res Function(DatabaseFailure) _then;
}

/// @nodoc
abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServerErrorCopyWithImpl<$Res>
    extends _$DatabaseFailureCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(
      ServerError _value, $Res Function(ServerError) _then)
      : super(_value, (v) => _then(v as ServerError));

  @override
  ServerError get _value => super._value as ServerError;
}

/// @nodoc

class _$ServerError implements ServerError {
  const _$ServerError();

  @override
  String toString() {
    return 'DatabaseFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() noConnection,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NoConnection value) noConnection,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NoConnection value)? noConnection,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements DatabaseFailure {
  const factory ServerError() = _$ServerError;
}

/// @nodoc
abstract class $NoConnectionCopyWith<$Res> {
  factory $NoConnectionCopyWith(
          NoConnection value, $Res Function(NoConnection) then) =
      _$NoConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoConnectionCopyWithImpl<$Res>
    extends _$DatabaseFailureCopyWithImpl<$Res>
    implements $NoConnectionCopyWith<$Res> {
  _$NoConnectionCopyWithImpl(
      NoConnection _value, $Res Function(NoConnection) _then)
      : super(_value, (v) => _then(v as NoConnection));

  @override
  NoConnection get _value => super._value as NoConnection;
}

/// @nodoc

class _$NoConnection implements NoConnection {
  const _$NoConnection();

  @override
  String toString() {
    return 'DatabaseFailure.noConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NoConnection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() noConnection,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NoConnection value) noConnection,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NoConnection value)? noConnection,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class NoConnection implements DatabaseFailure {
  const factory NoConnection() = _$NoConnection;
}
