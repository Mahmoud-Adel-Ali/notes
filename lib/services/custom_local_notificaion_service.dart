import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

abstract class CustomLocalNotificaionService {
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

  static StreamController<NotificationResponse> streamController =
      StreamController();
  static onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);
  }

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
  // static Future customNotification() async {
  //   NotificationDetails details = const NotificationDetails(
  //     android: AndroidNotificationDetails(
  //       'id 0',
  //       'channelName',
  //       priority: Priority.high,
  //       importance: Importance.max,
  //     ),
  //   );
  //   flutterLocalNotificationsPlugin.show(
  //     0,
  //     "Custom Notification",
  //     'body', // some content data
  //     details,
  //     payload: "payload data", //  all content data
  //   );
  // }

  // 2. basice notification
  static Future basiceNotification() async {
    AndroidNotificationSound sound = RawResourceAndroidNotificationSound(
        'notification_sound.mp3'.split('.').first);
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        'id 0',
        'channelName',
        priority: Priority.high,
        importance: Importance.max,
        sound: sound,
      ),
    );
    flutterLocalNotificationsPlugin.show(
      0,
      "Basice Notification",
      'body', // some content data
      details,
      payload: "Basice Notification payload data", //  all content data
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
      payload: "Repeated Notification payload data", //  all content data
    );
  }

  // 4. scheduled notification
  static Future scheduledNotification() async {
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails(
        'id 2',
        'channelName',
        priority: Priority.high,
        importance: Importance.max,
      ),
    );
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    var tzTime = tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5));
    // var tzTime = tz.TZDateTime(tz.local, 2024, 11, 26, 13, 55);
    flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      "Scheduled Notification",
      'body',
      tzTime,
      details,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: "Scheduled Notification payload data", //  all content data
    );
  }

  // 5. daily scheduled notification
  static Future dailyScheduledNotification() async {
    AndroidNotificationSound sound = RawResourceAndroidNotificationSound(
        'notification_sound.mp3'.split('.').first);
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        'id 3',
        'channelName',
        priority: Priority.high,
        importance: Importance.max,
        sound: sound,
      ),
    );
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    var currentTime = tz.TZDateTime.now(tz.local);
    var scheduleTime = tz.TZDateTime(
      tz.local,
      currentTime.year,
      currentTime.month,
      currentTime.day,
      20, // at 8 pm in the night
    );
    if (scheduleTime.isBefore(currentTime)) {
      scheduleTime = scheduleTime.add(const Duration(days: 1));
    }
    flutterLocalNotificationsPlugin.zonedSchedule(
      3,
      'ايه الاخبار ي صديقي',
      "متنساش تشوف تاسكاتك اليويميه ",
      scheduleTime,
      details,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: "Daily Scheduled Notification payload data", //  all content data
    );
  }
}

// 1. setup package (done)
// 2. basice notification
// 3. repeated notification
// 4. scheduled notification
// 5. custom Sound
// 6. on Tab
// 7. daly notification at specific time
// 5. Real example on Notes app
