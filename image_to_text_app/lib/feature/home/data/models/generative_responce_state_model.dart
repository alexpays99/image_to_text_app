enum AIResponceState {
  initial,
  loading,
  loaded,
  error,
  overloadedModelError,
  unsupportedLocationException,
}

class GenerativeResponceStateModel {
  GenerativeResponceStateModel({
    this.data,
    required this.trackListState,
    this.message,
  });

  String? data;
  AIResponceState trackListState = AIResponceState.initial;
  String? message;
}
