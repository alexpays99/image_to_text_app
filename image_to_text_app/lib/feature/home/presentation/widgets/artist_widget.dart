import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../navigation/router_paths.dart';
import '../../domain/entities/artist_base_info_entity.dart';

class Artist extends StatelessWidget {
  const Artist({
    super.key,
    required this.artist,
    required this.index,
  });

  final ArtistBaseInfoEntity artist;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: artist.pictureSmall.isEmpty
          ? null
          : () {
              context.go(
                '${RoutePaths.home}/${RoutePaths.artistInfo}',
                extra: artist,
              );
            },
      child: ListTile(
        title: Text(artist.name ?? ''),
      ),
    );
  }
}
