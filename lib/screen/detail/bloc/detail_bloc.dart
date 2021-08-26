import 'package:biys/data/source/local/local_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:biys/data/model/base.dart';
import 'package:biys/data/model/detail_restaurant.dart';
import 'package:biys/data/request/review_request.dart';
import 'package:biys/data/source/api/rest_client.dart';

enum DetailStatus { initial, success, loading, error }

class DetailState extends Equatable {
  final DetailStatus status;
  final String message;
  final DetailRestaurant? data;
  final bool isFav;
  DetailState({
    this.status = DetailStatus.initial,
    this.message = "",
    this.data,
    this.isFav = false,
  });

  @override
  List<Object?> get props => [status, message, data, isFav];

  DetailState copyWith({
    DetailStatus? status,
    String? message,
    DetailRestaurant? data,
    bool? isFav,
  }) {
    return DetailState(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      isFav: isFav ?? this.isFav,
    );
  }
}

class DetailCubit extends Cubit<DetailState> {
  final bool fromBookmark;
  final LocalStorage _local = LocalStorage();
  final RestClient _client;
  final String _id;
  DetailCubit(this._client, this._id, this.fromBookmark) : super(DetailState());

  void loadDetail() async {
    try {
      if (fromBookmark) {
        DetailRestaurant? detail = _local.getFavRestaurant(this._id);
        if (detail != null) {
          return emit(state.copyWith(
              data: detail, status: DetailStatus.success, isFav: true));
        }
        return emit(state.copyWith(
          status: DetailStatus.error,
          message: "error",
        ));
      }
      emit(state.copyWith(status: DetailStatus.loading));
      BaseRestaurant data = await _client.getDetail(_id);
      if (data.error == false && data.restaurant != null) {
        bool isFav = _local.checkIsFav(data.restaurant!);
        emit(state.copyWith(
          data: data.restaurant,
          status: DetailStatus.success,
          isFav: isFav,
        ));
      }
    } catch (e) {
      print(e.toString());
      emit(state.copyWith(
        status: DetailStatus.error,
        message: "Server error",
      ));
    }
  }

  void addReview(String name, String review) async {
    emit(state.copyWith(status: DetailStatus.loading));
    try {
      BaseCustomerReviews data = await _client.postReview(
          "12345", ReviewRequest(id: _id, name: name, review: review));
      if (data.error == false) {
        loadDetail();
      }
    } catch (e) {
      print(e.toString());
      emit(state.copyWith(
        status: DetailStatus.error,
        message: "Server error",
      ));
    }
  }

  void addToFavorite() {
    try {
      _local.addRestaurant(state.data!);
      emit(state.copyWith(
        isFav: true,
      ));
    } catch (e) {
      print(e.toString());
      emit(state.copyWith(
        status: DetailStatus.error,
        message: "error",
      ));
    }
  }

  void deleteFromFavorite() {
    try {
      _local.deleteRestaurant(state.data!);
      emit(state.copyWith(
        isFav: false,
      ));
    } catch (e) {
      print(e.toString());
      emit(state.copyWith(
        status: DetailStatus.error,
        message: "error",
      ));
    }
  }
}
