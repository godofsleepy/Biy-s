import 'package:biys/data/source/api/rest_client.dart';
import 'package:biys/screen/detail/bloc/detail_bloc.dart';
import 'package:biys/screen/detail/widget/menus_sheet.dart';
import 'package:biys/screen/detail/widget/review_sheet.dart';
import 'package:biys/utils/resource/rescolor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';

class DetailScreen extends StatefulWidget {
  final RestClient client;
  final String id;
  DetailScreen({Key? key, required this.client, required this.id})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late DetailCubit _detailCubit;
  late AnimationController _animationController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _detailCubit = DetailCubit(widget.id, widget.client);
    _detailCubit.loadDetail();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _detailCubit,
      child: Scaffold(
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
        body: BlocConsumer<DetailCubit, DetailState>(
          listener: (context, state) {
            if (state.status == DetailStatus.error) {
              final snackBar = SnackBar(
                duration: Duration(seconds: 3),
                backgroundColor: ResColor.yellow,
                elevation: 1,
                behavior: SnackBarBehavior.floating,
                content: Text(
                  state.message,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                action: SnackBarAction(
                  label: 'Ok',
                  textColor: Colors.white,
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (BuildContext context, state) {
            if (state.status == DetailStatus.loading) {
              return Center(
                child: CircularProgressIndicator(
                  color: ResColor.yellow,
                ),
              );
            } else if (state.status == DetailStatus.success) {
              return SingleChildScrollView(
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
                                          backgroundColor: Colors.white,
                                          context: context,
                                          isScrollControlled: true,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          builder: (context) {
                                            return menuSheet(state.data?.menus);
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
                                    onPressed: () {
                                      showModalBottomSheet(
                                          backgroundColor: Colors.white,
                                          context: context,
                                          isScrollControlled: true,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          builder: (context) {
                                            return ReviewSheet(
                                                customerReviews:
                                                    state.data?.customerReviews,
                                                detailCubit: _detailCubit);
                                          });
                                    },
                                    iconSize: 35,
                                    icon: Icon(
                                      Icons.reviews,
                                      color: ResColor.yellow,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Container(
                                  width: 63,
                                  child: Card(
                                    elevation: 6,
                                    shadowColor: ResColor.yellow,
                                    child: LikeButton(
                                      likeCountPadding: EdgeInsets.zero,
                                      size: 55,
                                      bubblesColor: BubblesColor(
                                        dotPrimaryColor: ResColor.yellow,
                                        dotSecondaryColor: ResColor.yellow,
                                      ),
                                      likeBuilder: (bool isLiked) {
                                        return Icon(
                                          isLiked
                                              ? Icons.bookmark
                                              : Icons.bookmark_outline,
                                          color: ResColor.yellow,
                                          size: 35,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 6,
                            child: Hero(
                              tag: state.data?.pictureId ?? "",
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
                                      offset: Offset(
                                          0, 2.5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(70),
                                    topLeft: Radius.circular(70),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: state.data?.pictureId != null
                                        ? "https://restaurant-api.dicoding.dev/images/medium/${state.data?.pictureId}"
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
                                    errorWidget:
                                        (context, object, stackTrace) =>
                                            Icon(Icons.error),
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
                      margin:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  state.data?.name ?? "",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text(
                                state.data?.categories
                                        ?.map((i) => i.name)
                                        .join(", ") ??
                                    "",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: ResColor.yellow,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              RatingBar.builder(
                                glowRadius: 0,
                                unratedColor: Colors.transparent,
                                initialRating: (state.data?.rating ?? 0),
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
                              // Text("/ ${state.}"),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            state.data?.description ?? "",
                          ),
                          SizedBox(height: 20),
                          SafeArea(
                            top: false,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              child: Text(
                                  "📍 ${state.data?.address ?? '-'}, ${state.data?.city ?? '-'}"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return Expanded(
              child: Center(child: Image.asset("assets/empty.jpeg")),
            );
          },
        ),
      ),
    );
  }
}
