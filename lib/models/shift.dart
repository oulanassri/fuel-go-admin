
class ShiftModel {
  final String? id,start,end,total;

  ShiftModel({
    this.id,
    this.start,
    this.end,
    this.total,

  });
}

List shiftsList = [
  ShiftModel(
    id: "1",
    start: "AM\t8",
    end: "PM\t4",
    total: "Hour\t8",
  ),
  ShiftModel(
    id: "2",
    start: "PM\t4",
    end: "AM\t12",
    total: "Hour\t8",
  ),
  ShiftModel(
    id: "3",
    start: "AM\t12",
    end:  "AM\t8",
    total: "Hour\t8",
  ),
];
