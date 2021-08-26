import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:biys/data/source/api/rest_client.dart';
import 'package:biys/screen/bookmark/bloc/bookmark_bloc.dart';
import 'package:biys/screen/bookmark/widget/item_bookmark.dart';
import 'package:biys/utils/resource/rescolor.dart';

class BookmarkScreen extends StatefulWidget {
  final RestClient restClient;
  BookmarkScreen({
    Key? key,
    required this.restClient,
  }) : super(key: key);

  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  late BookmarkCubit _bookmarkCubit;

  @override
  void initState() {
    super.initState();
    _bookmarkCubit = BookmarkCubit();
    _bookmarkCubit..add(BookmarkEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bookmarkCubit,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: false,
            title: Text(
              "Bookmark",
              style: TextStyle(
                color: ResColor.yellow,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: BlocConsumer<BookmarkCubit, BookmarkState>(
            listenWhen: (previous, next) {
              if (previous != next) {
                return true;
              }
              return false;
            },
            listener: (context, state) {
              if (state.status == BookmarkStatus.error) {
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
            builder: (context, state) {
              print("Build");
              if (state.status == BookmarkStatus.success) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.data.length,
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  itemBuilder: (contex, index) {
                    return itemBookmark(
                      context,
                      state.data[index],
                      () {
                        Navigator.pushNamed(
                          context,
                          "/detail/bookmark",
                          arguments: {
                            "rest": widget.restClient,
                            "id": state.data[index].id,
                          },
                        ).then((value) => _bookmarkCubit.add(BookmarkEvent()));
                      },
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 18),
                );
              }
              return Center(child: Image.asset("assets/empty.jpeg"));
            },
          )),
    );
  }
}
