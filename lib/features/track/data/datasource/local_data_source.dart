import 'dart:ffi';

import 'package:delivery/shared/domain/models/either.dart';
import 'package:delivery/shared/exception/http_exception.dart';

abstract class TrackDataSource {
  Future<Either<AppException, bool>> getTrackData();
}

class TrackRemoteDataSource implements TrackDataSource {

  TrackRemoteDataSource();

  @override
  Future<Either<AppException, bool>> getTrackData() async {
    try {
      await Future.delayed(const Duration(seconds: 2), (){
      });
      return const Right(true);
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred',
          statusCode: 1,
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.loginUser',
        ),
      );
    }
  }
}