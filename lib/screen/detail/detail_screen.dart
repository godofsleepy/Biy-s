import 'package:biys/model/restaurant.dart';
import 'package:biys/utils/resource/rescolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailScreen extends StatefulWidget {
  final Restaurant restaurant;
  DetailScreen({Key? key, required this.restaurant}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 70,
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            color: Colors.white,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          elevation: 6,
                          shadowColor: ResColor.yellow,
                          child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  builder: (context) {
                                    return DraggableScrollableSheet(
                                        expand: false,
                                        builder: (context, controller) {
                                          return SingleChildScrollView(
                                            controller: controller,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                            ),
                                          );
                                        });
                                  });
                            },
                            iconSize: 35,
                            icon: Icon(
                              Icons.restaurant_menu,
                              color: ResColor.yellow,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Card(
                          elevation: 6,
                          shadowColor: ResColor.yellow,
                          child: IconButton(
                            onPressed: () {},
                            iconSize: 35,
                            icon: Icon(
                              Icons.reviews,
                              color: ResColor.yellow,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Card(
                          elevation: 6,
                          shadowColor: ResColor.yellow,
                          child: IconButton(
                            onPressed: () {},
                            iconSize: 35,
                            icon: Icon(
                              Icons.bookmark_outline,
                              color: ResColor.yellow,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: Hero(
                      tag: widget.restaurant.pictureId ?? "",
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(70),
                            topLeft: Radius.circular(70),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ResColor.yellow.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 2.5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(70),
                            topLeft: Radius.circular(70),
                          ),
                          child: Image.network(
                            widget.restaurant.pictureId ?? "",
                            fit: BoxFit.cover,
                            height: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.restaurant.name ?? "",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        widget.restaurant.city ?? "",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: ResColor.yellow,
                        ),
                      ),
                    ],
                  ),
                  RatingBar.builder(
                    glowRadius: 0,
                    unratedColor: Colors.transparent,
                    initialRating: (widget.restaurant.rating ?? 0),
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
                  SizedBox(height: 10),
                  SafeArea(
                    top: false,
                    child: Text(
                      widget.restaurant.description ?? "",
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
