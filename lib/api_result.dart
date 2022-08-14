import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youtube_apis/network_exceptions.dart';

part 'api_result.freezed.dart';

@freezed
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;

  const factory ApiResult.failure(NetworkExceptions networkExceptions) =
      Failure<T>;
}
