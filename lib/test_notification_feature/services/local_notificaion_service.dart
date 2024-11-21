import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class LocalNotificaionService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  //initialize package
  static Future<void> init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings(
        "@mipmap/ic_launcher",
      ),
      iOS: DarwinInitializationSettings(),
    );
    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: (details) {},
      onDidReceiveNotificationResponse: (details) {},
    );
  }
}


// 1. setup package (done)
// 2. basice notification
// 3. repeated notification
// 4. scheduled notification
