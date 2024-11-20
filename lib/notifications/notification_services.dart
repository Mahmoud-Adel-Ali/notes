import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  //Singleton pattern
  static final NotificationServices _notificationServices =
      NotificationServices._internal();
  factory NotificationServices() {
    return _notificationServices;
  }
  NotificationServices._internal();

  //instance of FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
}
