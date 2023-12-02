import 'package:delivery/shared/domain/models/either.dart';
import 'package:delivery/shared/exception/http_exception.dart';

abstract class TrackRepository {
  Future<Either<AppException, bool>> getTrackData();
}