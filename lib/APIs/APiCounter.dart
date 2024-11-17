class APiCounter {
  int? csr;
  int? ysr;
  int? cntt;
  int? stt;
  String? msg;

  APiCounter({this.csr, this.ysr, this.cntt, this.stt, this.msg});

  APiCounter.fromJson(Map<String, dynamic> json) {
    csr = json['csr'];
    ysr = json['ysr'];
    cntt = json['cntt'];
    stt = json['stt'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['csr'] = this.csr;
    data['ysr'] = this.ysr;
    data['cntt'] = this.cntt;
    data['stt'] = this.stt;
    data['msg'] = this.msg;
    return data;
  }
}
