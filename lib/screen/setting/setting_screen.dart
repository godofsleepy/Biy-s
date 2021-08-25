import 'dart:ui';

import 'package:biys/utils/resource/rescolor.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 34,
                    color: ResColor.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                  onTap: () async {
                    await canLaunch(
                            "https://www.linkedin.com/in/rifat-khadafy-b05378159/")
                        ? await launch(
                            "https://www.linkedin.com/in/rifat-khadafy-b05378159/")
                        : throw 'Could not launch ';
                  },
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Image.network(
                      "https://scontent-sin6-3.cdninstagram.com/v/t51.2885-19/s320x320/237119163_4440752802678736_3164882788951583613_n.jpg?_nc_ht=scontent-sin6-3.cdninstagram.com&_nc_cat=104&_nc_ohc=6x7IYLV9pf8AX-7SJTv&edm=ABfd0MgBAAAA&ccb=7-4&oh=b2995f800d324ca8df00222695189b78&oe=612C56A5&_nc_sid=7bff83",
                      height: 60,
                    ),
                  ),
                  title: Text(
                    "Rifat Khadafy",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: 35,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, "/bookmark");
                        },
                        leading: Icon(
                          Icons.bookmark,
                          color: ResColor.yellow,
                          size: 35,
                        ),
                        title: Text("Bookmark"),
                        trailing: Icon(
                          Icons.keyboard_arrow_right_rounded,
                          size: 35,
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.notifications,
                          color: ResColor.yellow,
                          size: 35,
                        ),
                        subtitle: Text("Daily Notification at 11 AM"),
                        title: Text("Notification"),
                        trailing:
                            Switch(value: false, onChanged: (value) => value),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
