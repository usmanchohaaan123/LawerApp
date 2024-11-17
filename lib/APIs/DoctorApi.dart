class DoctorApi {
  int? id;
  String? name;
  String? lname;
  String? cnic;
  String? mobileNo;
  int? amount;
  String? serviceName;
  int? fkDept;
  int? fkSliptype;
  String? slipType;
  String? deptName;
  String? descrp;
  String? descrp2;

  DoctorApi(
      {this.id,
        this.name,
        this.lname,
        this.cnic,
        this.mobileNo,
        this.amount,
        this.serviceName,
        this.fkDept,
        this.fkSliptype,
        this.slipType,
        this.deptName,
        this.descrp,
        this.descrp2});

  DoctorApi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lname = json['lname'];
    cnic = json['cnic'];
    mobileNo = json['mobileNo'];
    amount = json['amount'];
    serviceName = json['service_name'];
    fkDept = json['fkDept'];
    fkSliptype = json['fkSliptype'];
    slipType = json['slipType'];
    deptName = json['deptName'];
    descrp = json['descrp'];
    descrp2 = json['descrp2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lname'] = this.lname;
    data['cnic'] = this.cnic;
    data['mobileNo'] = this.mobileNo;
    data['amount'] = this.amount;
    data['service_name'] = this.serviceName;
    data['fkDept'] = this.fkDept;
    data['fkSliptype'] = this.fkSliptype;
    data['slipType'] = this.slipType;
    data['deptName'] = this.deptName;
    data['descrp'] = this.descrp;
    data['descrp2'] = this.descrp2;
    return data;
  }
}
