import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notes/test_notification_feature/services/local_notificaion_service.dart';
import 'package:notes/test_notification_feature/views/widgets/my_button.dart';

class TestViewBody extends StatefulWidget {
  const TestViewBody({super.key});

  @override
  State<TestViewBody> createState() => _TestViewBodyState();
}

class _TestViewBodyState extends State<TestViewBody> {
  void listenStreamNotification() {
    LocalNotificaionService.streamController.stream.listen(
      (notificationResponse) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NotificationDetailsView(
                notificationResponse: notificationResponse)));
      },
    );
  }

  @override
  void initState() {
    super.initState();
    listenStreamNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Notifications..",
            style: TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 40),
          MyButton(
            onPressed: () {
              LocalNotificaionService.basiceNotification();
            },
            onCancel: () {
              //base notification
              cancelBasicNotification();
            },
            title: "Basic",
          ),
          const SizedBox(height: 40),
          MyButton(
            onPressed: () {
              LocalNotificaionService.repeatedNotification();
            },
            onCancel: () {
              //repeated notification
              cancelRepeatedNotification();
            },
            title: "Repeated",
          ),
          const SizedBox(height: 40),
          MyButton(
            onPressed: () {
              LocalNotificaionService.scheduledNotification();
            },
            onCancel: () {
              cancelScheduledNotification();
            },
            title: "Scheduled",
          ),
          const SizedBox(height: 40),
          IconButton(
            onPressed: () {
              //base notification
              cancelBasicNotification();
              //repeated notification
              cancelRepeatedNotification();
              //scheduled notification
              cancelScheduledNotification();
            },
            icon: const Text("Cancel all"),
          ),
        ],
      ),
    );
  }

  void cancelScheduledNotification() {
    LocalNotificaionService.cancelNotification(2);
  }

  void cancelRepeatedNotification() {
    LocalNotificaionService.cancelNotification(1);
  }

  void cancelBasicNotification() {
    //base notification
    LocalNotificaionService.cancelNotification(0);
  }
}

class NotificationDetailsView extends StatelessWidget {
  const NotificationDetailsView(
      {super.key, required this.notificationResponse});
  final NotificationResponse notificationResponse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Details'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(notificationResponse.id!.toString()),
            const SizedBox(height: 25),
            Text(notificationResponse.actionId.toString()),
            const SizedBox(height: 25),
            Text(notificationResponse.payload.toString()),
          ],
        ),
      ),
    );
  }
}
