import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationsApi {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future init({bool initScheduled = false}) async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: androidSettings);
    await _notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (payload) async {
        print('Notification Payload: $payload');
      },
    );
  }

  //Method untuk menampilkan pesan notifikasi pada perangkat.
  static Future showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) =>
      _notifications.show(
        id,
        title,
        body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'channel_id',
            'channel name',
            channelDescription: 'channel description',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false,
          ),
        ),
        payload: payload,
      );

  //Method untuk membatalkan pesan notifikasi dapat dibatalkan oleh pengguna, kita tambahkan beberapa fungsi baru, yaitu fungsi cancelNotification, cancelAllNotification dan cancelNotificationByTag.
  Future cancelNotification(int id) => _notifications.cancel(id);
  Future cancelAllNotification() => _notifications.cancelAll();
  Future cancelNotificationByTag(String tag) =>
      _notifications.cancel(0, tag: tag);

//Fugsi yang digunakan untuk mengolah waktu munculnya pemberitahuan (notifikasi) berdasarkan zona waktu yang ditentukan (dalam hal ini yaitu “Asia/Jakarta”).
  static tz.TZDateTime _scheduledDaily(DateTime time) {
    final jakarta = tz.getLocation('Asia/Jakarta');
    tz.setLocalLocation(jakarta);
    final now = tz.TZDateTime.now(jakarta);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month,
        now.day, time.hour, time.minute, time.second);

    return scheduledDate.isBefore(now)
        ? scheduledDate.add(const Duration(days: 1))
        : scheduledDate;
  }

  //Fungsi yang digunakan untuk menjadwalkan kapan sebuah pesan pemberitahuan (notifikasi) akan muncul sesuai dengan waktu yang telah ditetapkan.
  static Future scheduledNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
    required DateTime scheduledDate,
  }) async {
    _notifications.zonedSchedule(
        id,
        title,
        body,
        _scheduledDaily(scheduledDate),
        const NotificationDetails(
          android: AndroidNotificationDetails('channel_id', 'channel name',
              channelDescription: 'channel deskription',
              importance: Importance.max,
              priority: Priority.high,
              showWhen: false),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: payload,
        matchDateTimeComponents: DateTimeComponents.time);
  }
}
