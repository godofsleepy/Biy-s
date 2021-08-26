import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:biys/data/source/local/local_storage.dart';
import 'package:biys/utils/background/background_service.dart';
import 'package:biys/utils/background/date_time_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<bool> {
  final LocalStorage _local = LocalStorage();
  SettingCubit() : super(false);

  void initialData() async {
    bool status = _local.getNotif();
    return emit(status);
  }

  void notificationSwitch(bool value) async {
    emit(value);
    if (value) {
      print('Activated');
      await AndroidAlarmManager.periodic(
        Duration(seconds: 10),
        1,
        BackgroundService.callback,
        // startAt: DateTime.now(),
        // startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      print('Canceled');
      await AndroidAlarmManager.cancel(1);
    }
    _local.setNotif(value);
  }
}
