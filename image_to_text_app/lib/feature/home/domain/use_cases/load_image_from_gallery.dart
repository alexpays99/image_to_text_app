import 'package:dartz/dartz.dart';
import 'package:image_to_text_app/feature/home/domain/repositories/image_picker_repository.dart';

import '../../../../core/domain/entities/failure.dart';
import '../../../../core/domain/use_cases/use_case.dart';

class LoadImageFromGalleryUseCase extends UseCase<String?, void> {
  LoadImageFromGalleryUseCase({required this.imagePickerRepository});

  final ImagePickerRepository imagePickerRepository;

  @override
  Future<Either<Failure, String?>> call(void params) async {
    final artists = await imagePickerRepository.pickImage();
    return artists.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }
}
