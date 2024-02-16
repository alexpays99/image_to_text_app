import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/failure.dart';
import '../../../../core/domain/use_cases/use_case.dart';
import '../repositories/album_repository.dart';

class LoadArtistsUseCase extends UseCase<String, String> {
  LoadArtistsUseCase({required this.albumRepository});

  final AlbumRepository albumRepository;

  @override
  Future<Either<Failure, String>> call(String params) async {
    final artists = await albumRepository.describeImage(params);
    return artists.fold(
      (l) => left(l),
      (r) => right(r),
    );
  }
}
