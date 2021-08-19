import 'package:biys/model/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget itemHome(Restaurant restaurant) {
  return Container(
    width: 250,
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
                  restaurant.pictureId ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name ?? "",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  RatingBar.builder(
                    glowRadius: 0,
                    unratedColor: Colors.transparent,
                    initialRating: (restaurant.rating ?? 0),
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemSize: 25,
                    itemBuilder: (context, _) => Text(
                      "⭐",
                      style: TextStyle(
                        fontSize: 5,
                      ),
                    ),
                    onRatingUpdate: (rating) => null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
