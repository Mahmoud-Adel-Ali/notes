import 'dart:developer';

import 'package:notes/test_notification_feature/services/local_notificaion_service.dart';
import 'package:workmanager/workmanager.dart';
// steps
//1.init work manager
//2.excute our task.
//3.register our task in work manager

class WorkManagerServices {
  void registerMyTask() async {
    //register my task
    await Workmanager().registerPeriodicTask(
      'id1',
      'show simple notification',
      frequency: const Duration(minutes: 15),
    );
  }

  //init work manager service
  Future<void> init() async {
    log("init flutter work manager service=======");
    await Workmanager().initialize(actionTask, isInDebugMode: true);
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
      LocalNotificaionService.basiceNotification();
      return Future.value(true);
    },
  );
}
