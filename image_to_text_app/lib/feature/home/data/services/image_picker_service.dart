import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../../../../core/domain/entities/failure.dart';

class ImagePickerService {
  ImagePickerService();

  final _picker = ImagePicker();
  final logger = Logger();

  Future<Either<Failure, String?>> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final imgPath = pickedFile.path;
        logger.d('Image path: $imgPath');
        return right(imgPath);
      } else {
        logger.d('No image selected.');
        return right(null);
      }
    } catch (e) {
      logger.d(e);
      return left(throw Exception(e));
    }
  }
}
