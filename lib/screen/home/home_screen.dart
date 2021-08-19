import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(14),
                child: Text(
                  "Find\nyour Best\nRestaurants!",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    // color: ResColor.green,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Search",
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
