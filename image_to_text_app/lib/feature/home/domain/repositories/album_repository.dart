import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/failure.dart';

abstract class AlbumRepository {
  Future<Either<Failure, String>> describeImage(base64ImageFormat);
}
