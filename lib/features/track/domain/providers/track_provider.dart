import 'package:delivery/features/authentication/data/datasource/local_data_source.dart';
import 'package:delivery/features/authentication/data/respository/auth_repository.dart';
import 'package:delivery/features/authentication/domain/repositories/auth_repository.dart';
import 'package:delivery/features/track/data/datasource/local_data_source.dart';
import 'package:delivery/features/track/data/respository/track_repository.dart';
import 'package:delivery/features/track/domain/repositories/track_repository.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final trackDataSourceProvider =
Provider.family<TrackDataSource, bool>(
      (_, networkService) => TrackRemoteDataSource(),
);

final trackRepositoryProvider = Provider<TrackRepository>(
      (ref) {
    final TrackDataSource dataSource =
    ref.watch(trackDataSourceProvider(true));
    return TrackRepositoryImpl(dataSource);
  },
);