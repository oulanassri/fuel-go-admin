class ShiftsModel {
  int? id;
  String? shiftName;
  int? startTime;
  int? endTime;

  ShiftsModel({this.id, this.shiftName, this.startTime, this.endTime});

  ShiftsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shiftName = json['shiftName'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shiftName'] = this.shiftName;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    return data;
  }
}
