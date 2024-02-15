import 'package:dartz/dartz.dart';
import '../../../../core/domain/entities/failure.dart';
import '../models/favourite_track_model.dart';

abstract class LocalDataSource {
  Future<Either<Failure, List<FavouriteTrackModel>>> readTracksFromBox();

  Future<void> insert(FavouriteTrackModel track);

  Future<void> delete(int trackId);
}

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl();

  @override
  Future<Either<Failure, List<FavouriteTrackModel>>> readTracksFromBox() async {
    return right([]);
  }

  @override
  Future<void> insert(FavouriteTrackModel track) async {}

  @override
  Future<void> delete(int trackId) async {}
}
