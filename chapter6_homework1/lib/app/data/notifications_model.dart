class NotificationModel {
  final int? id;
  final int idMedicine;
  final String time;

  NotificationModel({this.id, required this.idMedicine, required this.time});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_medicine': idMedicine,
      'time': time,
    };
  }
}
