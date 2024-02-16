import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/ui_constants.dart';
import '../../data/models/artist_list_state_model.dart';
import '../../domain/use_cases/load_artists.dart';

part 'artist_state.dart';
part 'artist_cubit.freezed.dart';

class ArtistCubit extends Cubit<ArtistState> {
  ArtistCubit(
    this._loadArtistsUsecase,
  ) : super(
          ArtistState(
            artistListStateModel: ArtistListStateModel(
              value: [],
              artistListState: ListState.initial,
            ),
          ),
        );

  final LoadArtistsUseCase _loadArtistsUsecase;

  Future<void> describeImage(String base64ImageFormat) async {
    emit(
      state.copyWith(
        artistListStateModel: ArtistListStateModel(
          value: null,
          artistListState: ListState.loading,
        ),
      ),
    );
    final artists = await _loadArtistsUsecase(base64ImageFormat);
    artists.fold(
      (l) => {
        emit(
          state.copyWith(
            artistListStateModel: ArtistListStateModel(
              artistListState: ListState.error,
              message: UIConstants.errorMessage,
            ),
          ),
        ),
      },
      (r) => {
        emit(
          state.copyWith(
            artistListStateModel: ArtistListStateModel(
              artistListState: ListState.loaded,
            ),
          ),
        ),
      },
    );
  }
}
