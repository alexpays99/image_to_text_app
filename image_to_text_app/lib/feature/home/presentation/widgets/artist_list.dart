import 'package:flutter/material.dart';
import 'package:image_to_text_app/feature/home/presentation/cubit/artist_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_to_text_app/core/injector.dart' as di;

import '../../data/models/artist_list_state_model.dart';

class ArtistList extends StatefulWidget {
  const ArtistList({super.key});

  @override
  _ArtistListState createState() => _ArtistListState();
}

class _ArtistListState extends State<ArtistList> {
  late ArtistCubit _artistCubit;

  @override
  void initState() {
    super.initState();
    _artistCubit = di.getIt<ArtistCubit>();
    _artistCubit.describeImage('');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistCubit, ArtistState>(
      builder: (context, state) {
        final artistList = state.artistListStateModel;
        switch (artistList?.artistListState) {
          case ListState.initial:
            return const SizedBox.shrink();
          case ListState.loading:
            return const Center(child: CircularProgressIndicator());
          case ListState.loaded:
            return const Text('Text');
          case ListState.error:
            return Center(
              child: Text(artistList?.message ?? ''),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
