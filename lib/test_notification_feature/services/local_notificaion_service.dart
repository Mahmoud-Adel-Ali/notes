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
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  static onTap(NotificationResponse notificationResponse) {}

  // Ensure this is a top-level function
  void backgroundHandler(NotificationResponse response) {
    // Handle the background notification here
    print("Notification received in background: ${response.payload}");
  }

  // 2. basice notification
  static Future basiceNotification() async {
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails(
        'id 0',
        'channelName',
        priority: Priority.high,
        importance: Importance.max,
      ),
    );
    flutterLocalNotificationsPlugin.show(
      0,
      "Basice Notification",
      'body', // some content data
      details,
      payload: "payload data", //  all content data
    );
  }
}


// 1. setup package (done)
// 2. basice notification
// 3. repeated notification
// 4. scheduled notification
