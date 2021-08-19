import 'dart:convert';

import 'package:biys/data/data.dart';
import 'package:biys/model/base.dart';
import 'package:biys/utils/resource/rescolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Base base;

  @override
  void initState() {
    super.initState();
    base = Base.fromJson(Data.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(14),
              child: Text(
                "Find\nYour Best\nRestaurants!",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: ResColor.yellow,
                  // color: ResColor.green,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: base.restaurants?.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    width: 250,
                    padding: EdgeInsets.only(
                      left: index == 0 ? 14 : 0,
                      right:
                          index == (base.restaurants?.length ?? 1 - 1) ? 14 : 0,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      elevation: 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(300),
                                ),
                                child: Image.network(
                                  base.restaurants?[index].pictureId ?? "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    base.restaurants?[index].name ?? "",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  RatingBar.builder(
                                    glowRadius: 0,
                                    unratedColor: Colors.transparent,
                                    initialRating:
                                        (base.restaurants?[index].rating ?? 0),
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemSize: 25,
                                    itemBuilder: (context, _) => Text(
                                      "⭐",
                                      style: TextStyle(
                                        fontSize: 5,
                                      ),
                                    ),
                                    onRatingUpdate: (rating) => {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
