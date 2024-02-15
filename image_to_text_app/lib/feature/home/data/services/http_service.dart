import 'package:dartz/dartz.dart';
import 'package:image_to_text_app/feature/home/domain/entities/artist_base_info_entity.dart';

import '../../../../core/domain/entities/failure.dart';
import '../models/artist_list_track/datum.dart';

class HttpService {
  HttpService();

  // final Dio dio;
  final logger = Logger();

  Future<Either<Failure, List<ArtistBaseInfoEntity>>> fetchArtists(
      int startIndex) async {
    try {
      logger.d('');
      return right([]);
    } catch (e) {
      return left(throw Exception(e));
    }
  }

  Future<Either<Failure, List<Datum>>> fetchArtistTrackList(
      {required String url}) async {
    try {
      return right([]);
    } catch (e) {
      return left(throw Exception(e));
    }
  }
}
