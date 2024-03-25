import 'package:chapter6_homework1/app/data/medicine_model.dart';
import 'package:sqflite/sqflite.dart';

import '../data/notifications_model.dart';

class DbHelper {
  static const _databaseName = 'medicine_notification.db';
  static const _databaseVersion = 1;

  static const medicineTableName = 'medicine';
  static const notificationsTableName = 'notifications';

  static const medicineColumnId = 'id';
  static const medicineColumnName = 'name';
  static const medicineColumnFrequency = 'frequency';

  static const notificationsColumnId = 'id';
  static const notificationsColumnIdMedicine = 'id_medicine';
  static const notificationsColumnTime = 'time';

  Database? _database;

  //Method Untuk Mengembalikan Objek database
  Future<Database> get database async {
    final dbPath = await getDatabasesPath();

    final path = dbPath + _databaseName;
    _database = await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);

    return _database!;
  }

  //Method Yang Digunakan Untuk Membuat(create) Database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $medicineTableName (
        $medicineColumnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $medicineColumnName TEXT NOT NULL,
        $medicineColumnFrequency INTEGER NOT NULL
      )''');

    await db.execute('''
CREATE TABLE $notificationsTableName (
  $notificationsColumnId INTEGER PRIMARY KEY AUTOINCREMENT,
  $notificationsColumnIdMedicine INTEGER NOT NULL,
  $notificationsColumnTime STRING NOT NULL,
  FOREIGN KEY($notificationsColumnIdMedicine) REFERENCES $medicineTableName($medicineColumnId)
  )''');
  }

//Method Yang Digunakan Untuk Memasukkan Data ke Dalam Database Medicine
  Future<void> insertMedicine(MedicineModel medicineModel) async {
    final db = await database;
    await db.insert(medicineTableName, medicineModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

//Method Yang Digunakan Untuk Mengembalikan Seluruh Data medicine Pada Tabel Medicine di Database
  Future<List<MedicineModel>> queryAllRowsMedicine() async {
    final db = await database;

    List<Map<String, dynamic>> medicines =
        await db.query(medicineTableName, orderBy: "$medicineColumnId DESC");

    return List.generate(
      medicines.length,
      (index) => MedicineModel(
        id: medicines[index]['id'],
        name: medicines[index]['name'],
        frequency: medicines[index]['frequency'],
      ),
    );
  }

//Method yang digunakan untuk mengembalikan satu baris (row) data medicine dari tabel medicine
  Future<MedicineModel> queryOneMedicine(int id) async {
    final db = await database;

    List<Map<String, dynamic>> medicine = await db.query(
      medicineTableName,
      orderBy: "$medicineColumnId DESC",
      where: "$medicineColumnId == ?",
      whereArgs: [id],
    );

    return MedicineModel(
      id: medicine[0]['id'],
      name: medicine[0]['name'],
      frequency: medicine[0]['frequency'],
    );
  }

//Method yang digunakan untuk mengembalikan sebuah “id” dari data medicine yang terakhir kali ditambahkan ke dalam tabel medicine.
  Future<int> getLastMedicineId() async {
    final db = await database;

    List<Map<String, dynamic>> medicine = await db.query(medicineTableName,
        orderBy: "$medicineColumnId DESC", limit: 1);

    return medicine[0]['id'];
  }

  //Method yang digunakan untuk menghapus data medicine berdasarkan id yang diberikan pada tabel medicine.
  Future<void> deleteMedicine(int id) async {
    final db = await database;

    await db.delete(medicineTableName,
        where: "$medicineColumnId == ?", whereArgs: [id]);
  }

  // ------- Handle Database Notifikasi ----

  //Method yang digunakan untuk menambahkan data notifikasi baru ke dalam tabel notification
  Future<void> insertNotification(NotificationModel notification) async {
    final db = await database;

    await db.insert(notificationsTableName, notification.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //Method yang digunakan untuk mengembalikan seluruh data notifikasi yang ada pada tabel notification.
  Future<List<NotificationModel>> queryAllRowsNotifications() async {
    final db = await database;

    List<Map<String, dynamic>> notifications = await db
        .query(notificationsTableName, orderBy: "$notificationsColumnId DESC");

    return List.generate(
      notifications.length,
      (index) => NotificationModel(
        id: notifications[index]['id'],
        idMedicine: notifications[index]['id_medicine'],
        time: notifications[index]['time'],
      ),
    );
  }

  //Method yang digunakan untuk mengembalikan data notifikasi berdasarkan id medicine yang diberikan.
  Future<List<NotificationModel>> getNotificationsByMedicineID(
      int idMedicine) async {
    final db = await database;

    List<Map<String, dynamic>> medicine = await db.query(notificationsTableName,
        orderBy: "$notificationsColumnId DESC",
        where: "$notificationsColumnIdMedicine == ?",
        whereArgs: [idMedicine]);

    return List.generate(
      medicine.length,
      (index) => NotificationModel(
          id: medicine[index]['id'],
          idMedicine: medicine[index]['id_medicine'],
          time: medicine[index]['time']),
    );
  }

  //Method yang digunakan untuk menghapus data notifikasi sesuai dengan id yang diberikan.
  Future<void> deleteNotification(int id) async {
    final db = await database;

    await db.delete(notificationsTableName,
        where: '$notificationsColumnIdMedicine == ?', whereArgs: [id]);
  }
}
