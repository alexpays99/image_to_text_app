part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    PickerStateModel? pickerStateModel,
    GenerativeResponceStateModel? generativeResponceStateModel,
  }) = _HomeState;
}
