import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/ui_constants.dart';
import '../../data/models/generative_responce_state_model.dart';
import '../../data/models/picker_state_model.dart';
import '../../domain/use_cases/load_image_from_gallery.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._loadImageFromGalleryUseCase,
  ) : super(
          HomeState(
            pickerStateModel: PickerStateModel(
              value: '',
              pickerState: ListState.initial,
            ),
          ),
        );

  final LoadImageFromGalleryUseCase _loadImageFromGalleryUseCase;

  Future<void> describeImage(String base64ImageFormat) async {
    emit(
      state.copyWith(
        pickerStateModel: PickerStateModel(
          value: null,
          pickerState: ListState.loading,
        ),
      ),
    );
    // final image = await _loadImageFromGalleryUseCase(base64ImageFormat);
    // image.fold(
    //   (l) => {
    //     emit(
    //       state.copyWith(
    //         pickerStateModel: PickerStateModel(
    //           pickerState: ListState.error,
    //           errorMessage: UIConstants.errorMessage,
    //         ),
    //       ),
    //     ),
    //   },
    //   (r) => {
    //     emit(
    //       state.copyWith(
    //         pickerStateModel: PickerStateModel(
    //           pickerState: ListState.loaded,
    //           value: r,
    //         ),
    //       ),
    //     ),
    //   },
    // );
  }

  Future<void> pickImageFromGallery() async {
    final image = await _loadImageFromGalleryUseCase(());
    image.fold(
      (l) => {
        emit(
          state.copyWith(
            pickerStateModel: PickerStateModel(
              pickerState: ListState.error,
              errorMessage: UIConstants.errorMessage,
              value: state.pickerStateModel?.value ?? '',
            ),
          ),
        ),
      },
      (r) => {
        if (r != null)
          emit(
            state.copyWith(
              pickerStateModel: PickerStateModel(
                pickerState: ListState.loaded,
                value: r,
              ),
            ),
          ),
      },
    );
  }
}
