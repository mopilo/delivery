import 'package:delivery/shared/domain/models/either.dart';
import 'package:delivery/shared/exception/http_exception.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, bool>> loginUser();
}