class MedicineModel {
  final int? id;
  final String name;
  final int frequency;

  MedicineModel({
    this.id,
    required this.name,
    required this.frequency,
  });

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'frequency': frequency};
  }
}
