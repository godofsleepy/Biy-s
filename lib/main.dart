import 'package:biys/utils/notification/notification_helper.dart';
import 'package:biys/utils/routes/route_generate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init("favorite");
  // final NotificationHelper _notificationHelper = NotificationHelper();
  // await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  // _notificationHelper.requestIOSPermissions(flutterLocalNotificationsPlugin);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biy\'s',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerate.generateRoute,
    );
  }
}
