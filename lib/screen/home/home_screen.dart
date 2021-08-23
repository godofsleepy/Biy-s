import 'package:biys/data/source/api/rest_client.dart';
import 'package:biys/screen/home/bloc/home_bloc.dart';
import 'package:biys/screen/home/widget/item_home.dart';
import 'package:biys/utils/resource/rescolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final RestClient client;
  HomeScreen({Key? key, required this.client}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit _homeCubit;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _homeCubit = HomeCubit(widget.client);
    _homeCubit.loadRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeCubit,
      child: Scaffold(
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
                  controller: _searchController,
                  onSubmitted: (query) {
                    _homeCubit.searchRestaurant(query);
                  },
                  decoration: InputDecoration(
                    hintText: "Search",
                    filled: true,
                    suffixIcon: InkWell(
                      child: Icon(Icons.close, color: Colors.grey[500]),
                      onTap: () {
                        _searchController.clear();
                        _homeCubit.loadRestaurant();
                      },
                    ),
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
              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state.status == HomeStatus.error) {
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
                  if (state.status == HomeStatus.loading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: ResColor.yellow,
                      ),
                    );
                  } else if (state.status == HomeStatus.success) {
                    return Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                "/detail",
                                arguments: {
                                  "rest": widget.client,
                                  "id": state.data.elementAt(index).id,
                                },
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: index == 0 ? 14 : 0,
                                right:
                                    index == (state.data.length - 1) ? 14 : 0,
                              ),
                              child: itemHome(state.data.elementAt(index)),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 8),
                      ),
                    );
                  }
                  return Expanded(
                    child: Center(child: Image.asset("assets/empty.jpeg")),
                  );
                },
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
