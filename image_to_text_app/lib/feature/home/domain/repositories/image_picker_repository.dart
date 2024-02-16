import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/failure.dart';

abstract class ImagePickerRepository {
  Future<Either<Failure, String?>> pickImage();
}
