import 'package:notes/services/custom_local_notificaion_service.dart';
import 'package:workmanager/workmanager.dart';

class CustomWorkManagerServices {
  void registerMyTask() async {
    //register my task
    await Workmanager().registerPeriodicTask(
      'id1',
      'My note app notifications .',
      frequency: const Duration(days: 1),
    );
  }

  //init work manager service
  Future<void> init() async {
    await Workmanager().initialize(actionTask);
    registerMyTask();
  }

  void cancelTask(String id) {
    Workmanager().cancelAll();
  }
}

@pragma('vm-entry-point')
void actionTask() {
  //show notification
  Workmanager().executeTask(
    (taskName, inputData) {
      CustomLocalNotificaionService.dailyScheduledNotification();
      return Future.value(true);
    },
  );
}

//1.schedule notification at 9 pm.
//2.execute for this notification.