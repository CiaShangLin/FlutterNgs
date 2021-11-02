enum Status {
  LOADING,
  ERROR,
  SUCCESS,
}

class StateResponse {
  Status status = Status.LOADING;
  String? data = null;
}
