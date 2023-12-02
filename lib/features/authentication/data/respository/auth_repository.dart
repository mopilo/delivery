import 'package:delivery/features/authentication/data/datasource/local_data_source.dart';
import 'package:delivery/features/authentication/domain/repositories/auth_repository.dart';
import 'package:delivery/shared/domain/models/either.dart';
import 'package:delivery/shared/exception/http_exception.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final LoginUserDataSource dataSource;

  AuthenticationRepositoryImpl(this.dataSource);

  @override
  Future<Either<AppException, bool>> loginUser() {
    return dataSource.loginUser();
  }
}