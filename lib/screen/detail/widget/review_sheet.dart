import 'package:flutter/material.dart';

import 'package:biys/data/model/customer_review.dart';
import 'package:biys/screen/detail/bloc/detail_bloc.dart';
import 'package:biys/utils/resource/rescolor.dart';

class ReviewSheet extends StatefulWidget {
  final List<CustomerReview>? customerReviews;
  final DetailCubit detailCubit;
  final bool fromBookmark;

  ReviewSheet({
    Key? key,
    this.customerReviews,
    required this.detailCubit,
    required this.fromBookmark,
  }) : super(key: key);

  @override
  _ReviewSheetState createState() => _ReviewSheetState();
}

class _ReviewSheetState extends State<ReviewSheet> {
  TextEditingController _name = TextEditingController();
  TextEditingController _review = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: false,
        builder: (context, controller) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
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
                      "Review",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.customerReviews?[index].name ?? '-'} • ${widget.customerReviews?[index].date ?? '-'}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                widget.customerReviews?[index].review ?? "-",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey.withOpacity(0.8),
                        thickness: 1,
                      ),
                      itemCount: widget.customerReviews?.length ?? 0,
                    ),
                    SizedBox(height: 40),
                    widget.fromBookmark
                        ? Container()
                        : Container(
                            height: 280,
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: ResColor.yellow,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Add Review",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextField(
                                  controller: _name,
                                  cursorColor: ResColor.yellow,
                                  decoration: InputDecoration(
                                    labelText: "Name",
                                  ),
                                ),
                                TextField(
                                  maxLines: 3,
                                  controller: _review,
                                  cursorColor: ResColor.yellow,
                                  decoration: InputDecoration(
                                    labelText: "Review",
                                  ),
                                ),
                                SizedBox(height: 15),
                                TextButton(
                                  onPressed: () {
                                    if (_name.text.isNotEmpty &&
                                        _review.text.isNotEmpty) {
                                      widget.detailCubit
                                          .addReview(_name.text, _review.text);
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: Text(
                                    "Add",
                                    style: TextStyle(
                                        color: ResColor.yellow,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
