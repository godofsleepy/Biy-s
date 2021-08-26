import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:biys/data/model/detail_restaurant.dart';
import 'package:biys/data/source/local/local_storage.dart';

enum BookmarkStatus { initial, success, error }

class BookmarkState extends Equatable {
  final BookmarkStatus status;
  final List<DetailRestaurant> data;
  final String message;
  BookmarkState({
    this.status = BookmarkStatus.initial,
    this.data = const [],
    this.message = "",
  });

  BookmarkState copyWith({
    BookmarkStatus? status,
    List<DetailRestaurant>? data,
    String? message,
  }) {
    return BookmarkState(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, data, message];
}

class BookmarkCubit extends Cubit<BookmarkState> {
  final LocalStorage _local = LocalStorage();
  BookmarkCubit() : super(BookmarkState());

  void intialData() {
    try {
      List<DetailRestaurant>? data = _local.getAllRestaurant();
      if (data != null) {
        emit(state.copyWith(status: BookmarkStatus.success, data: data));
      } else {
        emit(state.copyWith(
            status: BookmarkStatus.error, message: "Terjadi error"));
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(
          status: BookmarkStatus.error, message: "Terjadi error"));
    }
  }
}
