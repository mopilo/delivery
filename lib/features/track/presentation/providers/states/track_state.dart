import 'package:delivery/shared/exception/http_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track_state.freezed.dart';

@freezed
abstract class TrackState with _$TrackState {
  const factory TrackState.initial() = Initial;
  const factory TrackState.loading() = Loading;
  const factory TrackState.failure(AppException exception) = Failure;
  const factory TrackState.success() = Success;
}