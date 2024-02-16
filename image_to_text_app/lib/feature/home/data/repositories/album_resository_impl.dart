import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/failure.dart';
import '../../domain/repositories/album_repository.dart';
import '../data_sources/remote_datasource.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  AlbumRepositoryImpl(this._remoteDataSource);

  final RemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, String>> describeImage(base64ImageFormat) async {
    return await _remoteDataSource.describeImage(base64ImageFormat);
  }
}
