enum ListState {
  initial,
  loading,
  loaded,
  error,
}

class PickerStateModel {
  PickerStateModel({
    this.value,
    this.pickerState,
    this.errorMessage,
  });

  String? value;
  ListState? pickerState = ListState.initial;
  String? errorMessage;
}
