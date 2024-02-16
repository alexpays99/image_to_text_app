import 'package:dartz/dartz.dart';
import 'package:image_to_text_app/feature/home/data/data_sources/local_datasource.dart';
import 'package:image_to_text_app/feature/home/domain/repositories/image_picker_repository.dart';

import '../../../../core/domain/entities/failure.dart';

class ImagePickerRepositoryImpl implements ImagePickerRepository {
  ImagePickerRepositoryImpl(this._locakDataSource);

  final LocalDataSource _locakDataSource;

  @override
  Future<Either<Failure, String?>> pickImage() async {
    return await _locakDataSource.pickImage();
  }
}
