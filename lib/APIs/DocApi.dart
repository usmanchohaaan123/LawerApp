class DocApi {
  String? img;
  String? doctorName;
  String? doctorTitle;
  String? reservedDate;
  String? reservedTime;
  String? id;
  String? FkSliptype;
  String? FkService;
  String? amount;

  DocApi(
      {this.img,
        this.doctorName,
        this.doctorTitle,
        this.reservedDate,
        this.reservedTime,
        this.id,
        this.FkSliptype,
        this.FkService,
        this.amount,
      });

  DocApi.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    doctorName = json['doctorName'];
    doctorTitle = json['doctorTitle'];
    reservedDate = json['reservedDate'];
    reservedTime = json['reservedTime'];
    id = json['id'];
    FkSliptype = json['FkSliptype'];
    FkService = json['FkService'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['doctorName'] = this.doctorName;
    data['doctorTitle'] = this.doctorTitle;
    data['reservedDate'] = this.reservedDate;
    data['reservedTime'] = this.reservedTime;
    data['id'] = this.id;
    data['FkSliptype'] = this.FkSliptype;
    data['FkService'] = this.FkService;
    data['amount'] = this.amount;
    return data;
  }
}
