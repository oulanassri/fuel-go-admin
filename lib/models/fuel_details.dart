class FuelDetailsModel {
  int? fuelTypeId;
  String? fuelTypeName;
  String? centerName;
  int? price;

  FuelDetailsModel(
      {this.fuelTypeId, this.fuelTypeName, this.centerName, this.price});

  FuelDetailsModel.fromJson(Map<String, dynamic> json) {
    fuelTypeId = json['fuelTypeId'];
    fuelTypeName = json['fuelTypeName'];
    centerName = json['centerName'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fuelTypeId'] = this.fuelTypeId;
    data['fuelTypeName'] = this.fuelTypeName;
    data['centerName'] = this.centerName;
    data['price'] = this.price;
    return data;
  }
}
