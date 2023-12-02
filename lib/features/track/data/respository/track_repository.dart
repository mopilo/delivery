import 'package:delivery/features/track/data/datasource/local_data_source.dart';
import 'package:delivery/features/track/domain/repositories/track_repository.dart';
import 'package:delivery/shared/domain/models/either.dart';
import 'package:delivery/shared/exception/http_exception.dart';

class TrackRepositoryImpl extends TrackRepository {
  final TrackDataSource dataSource;

  TrackRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, bool>> getTrackData() {
    return dataSource.getTrackData();
  }
}