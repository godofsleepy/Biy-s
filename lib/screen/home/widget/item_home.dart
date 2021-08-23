import 'package:biys/data/model/restaurant.dart';
import 'package:biys/utils/resource/rescolor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget itemHome(Restaurant restaurant) {
  return Container(
    width: 250,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      elevation: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: restaurant.pictureId ?? "",
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(300),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: restaurant.pictureId != null
                        ? "https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}"
                        : "",
                    placeholder: (context, url) => Center(
                      child: Container(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          color: ResColor.yellow,
                        ),
                      ),
                    ),
                    errorWidget: (context, object, stackTrace) =>
                        Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
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
