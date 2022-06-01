class FutureResponse {
  bool err;
  String msg;

  FutureResponse({this.err = false, this.msg = ""});

  factory FutureResponse.fromJson(Map<String, dynamic> json) {
    return FutureResponse(
      err: json['err'],
      msg: json['msg'],
    );
  }
}
