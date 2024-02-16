import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_to_text_app/core/injector.dart' as di;

import '../domain/entities/artist_base_info_entity.dart';

class ArtistInfoPage extends StatefulWidget {
  const ArtistInfoPage({super.key, required this.artist});

  final ArtistBaseInfoEntity artist;

  @override
  State<ArtistInfoPage> createState() => _ArtistInfoPageState();
}

class _ArtistInfoPageState extends State<ArtistInfoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.artist.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            Text("${widget.artist.name}'s tracks:"),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
          ],
        ),
      ),
    );
  }
}
