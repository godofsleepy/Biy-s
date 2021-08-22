import 'package:biys/data/model/menus.dart';
import 'package:flutter/material.dart';

Widget menuSheet(Menus? menus) {
  return DraggableScrollableSheet(
      expand: false,
      builder: (context, controller) {
        return SingleChildScrollView(
          controller: controller,
          child: Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              children: [
                Text(
                  "Menus",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: menus?.foods?.length ?? 0,
                        itemBuilder: (context, index) => Text(
                          menus?.foods?[index].name ?? "-",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                        separatorBuilder: (_, index) => SizedBox(height: 20),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 400,
                      width: 1,
                      color: Colors.grey,
                    ),
                    Flexible(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: menus?.drinks?.length ?? 0,
                        itemBuilder: (context, index) => Text(
                          menus?.drinks?[index].name ?? "-",
                          textAlign: TextAlign.center,
                        ),
                        separatorBuilder: (_, index) => SizedBox(height: 20),
                      ),
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset("assets/popcorn.png"),
                )
              ],
            ),
          ),
        );
      });
}
