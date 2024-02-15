import 'package:dartz/dartz.dart';
import 'package:image_to_text_app/core/domain/entities/failure.dart';

import '../../data/models/favourite_track_model.dart';

abstract class FavouriteAlbumRepository {
  Future<Either<Failure, List<FavouriteTrackModel>>> readTracksFromBox();

  Future<void> insert(FavouriteTrackModel track);

  Future<void> delete(int index);
}
