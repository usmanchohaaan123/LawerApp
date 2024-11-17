class ScheulelApi {
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
  String? doctorName;
  String? descrp;
  String? descrp2;
  String? status;
  String? patName;
  String? mobileNo;
  String? cnic;

  ScheulelApi(
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
        this.serviceName,
        this.doctorName,
        this.descrp,
        this.descrp2,
        this.status,
        this.patName,
        this.mobileNo,
        this.cnic});

  ScheulelApi.fromJson(Map<String, dynamic> json) {
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
    doctorName = json['doctor_name'];
    descrp = json['descrp'];
    descrp2 = json['descrp2'];
    status = json['status'];
    patName = json['pat_name'];
    mobileNo = json['mobile_no'];
    cnic = json['cnic'];
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
    data['doctor_name'] = this.doctorName;
    data['descrp'] = this.descrp;
    data['descrp2'] = this.descrp2;
    data['status'] = this.status;
    data['pat_name'] = this.patName;
    data['mobile_no'] = this.mobileNo;
    data['cnic'] = this.cnic;
    return data;
  }
}
