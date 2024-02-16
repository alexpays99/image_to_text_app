import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/failure.dart';
import '../services/http_service.dart';

abstract class RemoteDataSource {
  Future<Either<Failure, String>> describeImage(String base64ImageFormat);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl(this.httpService);

  final AIGenerativeService httpService;

  @override
  Future<Either<Failure, String>> describeImage(
      String base64ImageFormat) async {
    return await httpService.describeImage(base64ImageFormat);
  }
}
