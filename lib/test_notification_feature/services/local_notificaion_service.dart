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

  //cancel Notification
  static Future cancelNotification(int notificationId) async {
    await flutterLocalNotificationsPlugin.cancel(notificationId);
  }

  // 1. custom notification
  static Future customNotification() async {
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails(
        'id 2',
        'channelName',
        priority: Priority.high,
        importance: Importance.max,
      ),
    );
    flutterLocalNotificationsPlugin.show(
      1,
      "Custom Notification",
      'body', // some content data
      details,
      payload: "payload data", //  all content data
    );
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
      1,
      "Basice Notification",
      'body', // some content data
      details,
      payload: "payload data", //  all content data
    );
  }

  // 3. repeated notification
  static Future repeatedNotification() async {
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails(
        'id 1',
        'channelName',
        priority: Priority.high,
        importance: Importance.max,
      ),
    );
    RepeatInterval repeatInterval = RepeatInterval.everyMinute;
    AndroidScheduleMode androidScheduleMode = AndroidScheduleMode.alarmClock;
    flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      "Repeated Notification",
      'body', // some content data
      repeatInterval,
      details,
      androidScheduleMode: androidScheduleMode,
      payload: "payload data", //  all content data
    );
  }
}


// 1. setup package (done)
// 2. basice notification
// 3. repeated notification
// 4. scheduled notification
