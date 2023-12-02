import 'package:delivery/features/authentication/data/datasource/local_data_source.dart';
import 'package:delivery/features/authentication/data/respository/auth_repository.dart';
import 'package:delivery/features/authentication/domain/repositories/auth_repository.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final authDataSourceProvider =
Provider.family<LoginUserDataSource, bool>(
      (_, networkService) => LoginUserRemoteDataSource(),
);

final authRepositoryProvider = Provider<AuthenticationRepository>(
      (ref) {
    final LoginUserDataSource dataSource =
    ref.watch(authDataSourceProvider(true));
    return AuthenticationRepositoryImpl(dataSource);
  },
);