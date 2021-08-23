import 'package:biys/data/model/base.dart';
import 'package:biys/data/source/api/rest_client.dart';
import 'package:equatable/equatable.dart';

import 'package:biys/data/model/detail_restaurant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum DetailStatus { initial, success, loading, error }

class DetailState extends Equatable {
  final DetailStatus status;
  final String message;
  final DetailRestaurant? data;
  DetailState({
    this.status = DetailStatus.initial,
    this.message = "",
    this.data,
  });

  @override
  List<Object?> get props => [status, message, data];

  DetailState copyWith({
    DetailStatus? status,
    String? message,
    DetailRestaurant? data,
  }) {
    return DetailState(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

class DetailCubit extends Cubit<DetailState> {
  final RestClient _client;
  final String _id;
  DetailCubit(this._id, this._client) : super(DetailState());

  void loadDetail() async {
    emit(state.copyWith(status: DetailStatus.loading));
    try {
      BaseRestaurant data = await _client.getDetail(_id);
      if (data.error == false) {
        emit(state.copyWith(
          data: data.restaurant,
          status: DetailStatus.success,
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
}
