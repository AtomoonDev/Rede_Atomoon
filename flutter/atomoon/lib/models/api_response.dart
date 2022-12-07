class ApiResponse<T> {
  late bool statusOk;
  late String msg;
  late T result;

  ApiResponse.statusOk(this.result) {
    statusOk = true;
  }
  ApiResponse.error(this.msg) {
    statusOk = false;
  }
}
