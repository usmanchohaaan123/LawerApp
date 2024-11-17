class AppointAp {
  int? id;
  int? fkDoctor;
  int? fkPat;
  String? date;
  String? datetime;
  int? srNo;
  int? fkSliptype;
  int? satus;
  int? fkService;
  int? amount;
  String? serviceName;

  AppointAp(
      {this.id,
        this.fkDoctor,
        this.fkPat,
        this.date,
        this.datetime,
        this.srNo,
        this.fkSliptype,
        this.satus,
        this.fkService,
        this.amount,
        this.serviceName});

  AppointAp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fkDoctor = json['fkDoctor'];
    fkPat = json['fkPat'];
    date = json['date'];
    datetime = json['datetime'];
    srNo = json['srNo'];
    fkSliptype = json['fkSliptype'];
    satus = json['satus'];
    fkService = json['fk_service'];
    amount = json['amount'];
    serviceName = json['service_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fkDoctor'] = this.fkDoctor;
    data['fkPat'] = this.fkPat;
    data['date'] = this.date;
    data['datetime'] = this.datetime;
    data['srNo'] = this.srNo;
    data['fkSliptype'] = this.fkSliptype;
    data['satus'] = this.satus;
    data['fk_service'] = this.fkService;
    data['amount'] = this.amount;
    data['service_name'] = this.serviceName;
    return data;
  }
}
