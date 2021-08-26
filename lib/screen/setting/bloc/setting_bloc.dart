import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:biys/data/source/local/local_storage.dart';
import 'package:biys/utils/background/background_service.dart';
import 'package:biys/utils/background/date_time_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingState extends Equatable {
  final bool statusAlarm;
  SettingState({
    this.statusAlarm = false,
  });

  SettingState copyWith({
    bool? statusAlarm,
  }) {
    return SettingState(
      statusAlarm: statusAlarm ?? this.statusAlarm,
    );
  }

  @override
  List<Object> get props => [statusAlarm];
}

class SettingCubit extends Cubit<SettingState> {
  final LocalStorage _local = LocalStorage();
  SettingCubit() : super(SettingState());

  void initialData() {
    bool status = _local.getNotif();
    emit(state.copyWith(statusAlarm: status));
  }

  void notificationSwitch(bool value) async {
    emit(state.copyWith(statusAlarm: value));
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
      print('Scheduling News Canceled');
      await AndroidAlarmManager.cancel(1);
    }
    _local.setNotif(value);
  }
}
