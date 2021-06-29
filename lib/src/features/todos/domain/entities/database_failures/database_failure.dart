import 'package:freezed_annotation/freezed_annotation.dart';

part 'database_failure.freezed.dart';

@freezed
class DatabaseFailure with _$DatabaseFailure {
  const factory DatabaseFailure.serverError() = ServerError;
  const factory DatabaseFailure.noConnection() = NoConnection;
}
