import 'package:biys/data/data.dart';
import 'package:biys/model/base.dart';
import 'package:biys/model/restaurant.dart';
import 'package:biys/screen/home/widget/item_home.dart';
import 'package:biys/utils/resource/rescolor.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Base _base;
  late List<Restaurant> _restaurants = [];

  @override
  void initState() {
    super.initState();
    _loadData();
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
                onChanged: (query) {
                  setState(() {
                    _restaurants = _base.restaurants!
                        .where((restaurant) => restaurant.name!
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                        .toList();
                  });
                },
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
            _restaurants.isEmpty
                ? Expanded(
                    child: Center(child: Image.asset("assets/empty.jpeg")),
                  )
                : Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _restaurants.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/detail",
                              arguments: _restaurants.elementAt(index),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: index == 0 ? 14 : 0,
                              right:
                                  index == (_restaurants.length - 1) ? 14 : 0,
                            ),
                            child: itemHome(_restaurants.elementAt(index)),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 8),
                    ),
                  ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _loadData() {
    setState(() {
      _base = Base.fromJson(Data.data);
      _restaurants = _base.restaurants ?? [];
    });
  }
}
