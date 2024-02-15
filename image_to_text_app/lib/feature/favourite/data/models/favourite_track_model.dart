import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../home/data/models/artist_list_track/datum.dart';

part 'favourite_track_model.freezed.dart';

@freezed
class FavouriteTrackModel with _$FavouriteTrackModel {
  const factory FavouriteTrackModel({
    int? id,
    String? title,
    int? duration,
    String? artistName,
    @Default(false) bool isFavourite,
  }) = _FavouriteTrackModel;

  factory FavouriteTrackModel.fromRemoteTrackModel(Datum trackModel) =>
      FavouriteTrackModel(
        id: trackModel.id,
        title: trackModel.title,
        duration: trackModel.duration,
        artistName: trackModel.artist?.name,
      );
}
