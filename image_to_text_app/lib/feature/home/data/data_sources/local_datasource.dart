import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/failure.dart';
import '../services/image_picker_service.dart';

abstract class LocalDataSource {
  Future<Either<Failure, String?>> pickImage();
}

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl(this.imagePickerService);

  final ImagePickerService imagePickerService;

  @override
  Future<Either<Failure, String?>> pickImage() async {
    return await imagePickerService.pickImage();
  }
}
