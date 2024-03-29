import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_to_text_app/feature/home/domain/entities/artist_base_info_entity.dart';

part 'artist_base_info.freezed.dart';
part 'artist_base_info.g.dart';

@freezed
class ArtistBaseInfo with _$ArtistBaseInfo {
  const ArtistBaseInfo._();

  const factory ArtistBaseInfo({
    @Default(0) int id,
    String? name,
    String? link,
    String? share,
    @Default('') String picture,
    @Default('') @JsonKey(name: 'picture_small') String pictureSmall,
    @Default('') @JsonKey(name: 'picture_medium') String pictureMedium,
    @Default('') @JsonKey(name: 'picture_big') String pictureBig,
    @Default('') @JsonKey(name: 'picture_xl') String pictureXl,
    @JsonKey(name: 'nb_album') int? nbAlbum,
    @JsonKey(name: 'nb_fan') int? nbFan,
    bool? radio,
    @Default('') String tracklist,
    String? type,
  }) = _ArtistBaseInfo;

  factory ArtistBaseInfo.fromJson(Map<String, dynamic> json) =>
      _$ArtistBaseInfoFromJson(json);

  ArtistBaseInfoEntity get entity => ArtistBaseInfoEntity(
        id: id,
        name: name,
        link: link,
        share: share,
        picture: picture,
        pictureSmall: pictureSmall,
        pictureMedium: pictureMedium,
        pictureBig: pictureBig,
        pictureXl: pictureXl,
        nbAlbum: nbAlbum,
        nbFan: nbFan,
        radio: radio,
        tracklist: tracklist,
        type: type,
      );
}
