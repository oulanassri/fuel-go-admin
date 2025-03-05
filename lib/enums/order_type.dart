enum OrderType{completed,cancelled,inProgress,upcoming}
extension TagOrderType on OrderType {
  String get type {
    switch(this){
      case OrderType.completed:return "المكتملة";
      case OrderType.cancelled:return "الملغاة";
      case OrderType.upcoming:return "القادمة";
      case OrderType.inProgress:return "قيد التنفيذ";
    }
  }
}
String getOrderType(OrderType val) {
  if (val.name == "completed") {
    return "المكتملة";
  } else if (val.name == "cancelled") {
    return "الملغاة";
  } else if (val.name == "upcoming") {
    return "القادمة";
  }else if (val.name == "inProgress") {
    return "قيد التنفيذ";
  }
  throw Exception('$val is not a valid value for FlightScheduleStatus.');
}