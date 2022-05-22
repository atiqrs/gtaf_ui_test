class Responses<T> {
  Status status;
  T? data;
  String? message;
  Responses.loading(this.message) : status = Status.LOADING;
  Responses.completed(this.data) : status = Status.COMPLETED;
  Responses.error(this.message) : status = Status.ERROR;
  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
