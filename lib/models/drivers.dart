class DriversModel {
  String? name;
  String? phone;
  String? email;
  bool? isDriving;

  DriversModel({this.name, this.phone, this.email, this.isDriving});

  DriversModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    isDriving = json['isDriving'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['isDriving'] = this.isDriving;
    return data;
  }
}
