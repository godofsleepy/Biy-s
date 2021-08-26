import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:biys/data/model/detail_restaurant.dart';
import 'package:biys/data/source/local/local_storage.dart';

enum BookmarkStatus { initial, success, error, loading }

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

class BookmarkEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class BookmarkCubit extends Bloc<BookmarkEvent, BookmarkState> {
  final LocalStorage _local = LocalStorage();
  BookmarkCubit() : super(BookmarkState());

  @override
  Stream<BookmarkState> mapEventToState(BookmarkEvent event) async* {
    try {
      yield (state.copyWith(status: BookmarkStatus.loading));
      List<DetailRestaurant>? data = _local.getAllRestaurant();
      if (data != null) {
        if (data.isEmpty) {
          yield (state.copyWith(
              status: BookmarkStatus.error, message: "Belum ada favorite"));
        } else {
          yield (state.copyWith(status: BookmarkStatus.success, data: data));
        }
      } else {
        yield (state.copyWith(
            status: BookmarkStatus.error, message: "Terjadi error"));
      }
    } catch (e) {
      print(e);
      yield (state.copyWith(
          status: BookmarkStatus.error, message: "Terjadi error"));
    }
  }
}
