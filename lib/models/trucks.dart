class TrucksModel {
  String? plateNumber;
  double? lat;
  double? long;
  int? fuelTankCapacity;
  int? cargoTankCapacity;
  int? fuelTankFullCapacity;
  int? cargoTankFullCapacity;
  String? fuelTankTypeName;
  String? cargoTankTypeName;

  TrucksModel(
      {this.plateNumber,
        this.lat,
        this.long,
        this.fuelTankCapacity,
        this.cargoTankCapacity,
        this.fuelTankFullCapacity,
        this.cargoTankFullCapacity,
        this.fuelTankTypeName,
        this.cargoTankTypeName});

  TrucksModel.fromJson(Map<String, dynamic> json) {
    plateNumber = json['plateNumber'];
    lat = json['lat'];
    long = json['long'];
    fuelTankCapacity = json['fuelTankCapacity'];
    cargoTankCapacity = json['cargoTankCapacity'];
    fuelTankFullCapacity = json['fuelTankFullCapacity'];
    cargoTankFullCapacity = json['cargoTankFullCapacity'];
    fuelTankTypeName = json['fuelTankTypeName'];
    cargoTankTypeName = json['cargoTankTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plateNumber'] = this.plateNumber;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['fuelTankCapacity'] = this.fuelTankCapacity;
    data['cargoTankCapacity'] = this.cargoTankCapacity;
    data['fuelTankFullCapacity'] = this.fuelTankFullCapacity;
    data['cargoTankFullCapacity'] = this.cargoTankFullCapacity;
    data['fuelTankTypeName'] = this.fuelTankTypeName;
    data['cargoTankTypeName'] = this.cargoTankTypeName;
    return data;
  }
}
