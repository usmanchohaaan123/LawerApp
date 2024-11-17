class SignUpR {
  int? id;
  String? name;
  String? lname;
  String? cnic;
  String? mobileNo;
  String? dob;
  String? date;
  String? datetime;
  int? isActive;
  String? loginName;
  String? password;
  String? patName;

  SignUpR(
      {this.id,
        this.name,
        this.lname,
        this.cnic,
        this.mobileNo,
        this.dob,
        this.date,
        this.datetime,
        this.isActive,
        this.loginName,
        this.password,
        this.patName});

  SignUpR.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lname = json['lname'];
    cnic = json['cnic'];
    mobileNo = json['mobileNo'];
    dob = json['dob'];
    date = json['date'];
    datetime = json['datetime'];
    isActive = json['isActive'];
    loginName = json['loginName'];
    password = json['password'];
    patName = json['patName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lname'] = this.lname;
    data['cnic'] = this.cnic;
    data['mobileNo'] = this.mobileNo;
    data['dob'] = this.dob;
    data['date'] = this.date;
    data['datetime'] = this.datetime;
    data['isActive'] = this.isActive;
    data['loginName'] = this.loginName;
    data['password'] = this.password;
    data['patName'] = this.patName;
    return data;
  }
}
