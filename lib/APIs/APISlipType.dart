class APISlipType {
  int? id;
  String? name;
  int? fkDept;
  int? isactive;
  String? colorCode;
  String? imgPath;

  APISlipType(
      {this.id,
        this.name,
        this.fkDept,
        this.isactive,
        this.colorCode,
        this.imgPath});

  APISlipType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fkDept = json['fkDept'];
    isactive = json['isactive'];
    colorCode = json['colorCode'];
    imgPath = json['imgPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['fkDept'] = this.fkDept;
    data['isactive'] = this.isactive;
    data['colorCode'] = this.colorCode;
    data['imgPath'] = this.imgPath;
    return data;
  }
}
