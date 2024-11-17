class LoginApi {
  int? id;
  String? loginName;
  String? password;
  int? fkType;
  String? typeName;
  String? date;
  String? datetime;
  int? fkPatient;
  int? isActive;
  String? patName;

  LoginApi(
      {this.id,
        this.loginName,
        this.password,
        this.fkType,
        this.typeName,
        this.date,
        this.datetime,
        this.fkPatient,
        this.isActive,
        this.patName});

  LoginApi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loginName = json['loginName'];
    password = json['password'];
    fkType = json['fkType'];
    typeName = json['typeName'];
    date = json['date'];
    datetime = json['datetime'];
    fkPatient = json['fkPatient'];
    isActive = json['is_active'];
    patName = json['patName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['loginName'] = this.loginName;
    data['password'] = this.password;
    data['fkType'] = this.fkType;
    data['typeName'] = this.typeName;
    data['date'] = this.date;
    data['datetime'] = this.datetime;
    data['fkPatient'] = this.fkPatient;
    data['is_active'] = this.isActive;
    data['patName'] = this.patName;
    return data;
  }
}
