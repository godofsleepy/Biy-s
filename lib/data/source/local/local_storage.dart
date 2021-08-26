import 'package:biys/data/model/detail_restaurant.dart';
import 'package:get_storage/get_storage.dart';
import 'package:collection/collection.dart';

class LocalStorage {
  final GetStorage _box = GetStorage("favorite");

  addRestaurant(DetailRestaurant detail) {
    List<dynamic>? data = _box.read('data');
    if (data == null) {
      _box.write('data', [detail.toJson()]);
    } else {
      data.add(detail.toJson());
      _box.write('data', data);
    }
  }

  List<DetailRestaurant>? getAllRestaurant() {
    List<dynamic>? data = _box.read('data');
    if (data == null) {
      return [];
    } else {
      return data
          .map((e) => DetailRestaurant.fromJson(e as Map<String, dynamic>))
          .toList();
    }
  }

  bool checkIsFav(DetailRestaurant detail) {
    List<dynamic>? data = _box.read('data');
    if (data == null) {
      return false;
    } else {
      Map<String, dynamic>? resto = data.firstWhereOrNull(
        (element) => element["id"] == detail.id,
      );
      if (resto != null) {
        return true;
      }
      return false;
    }
  }

  DetailRestaurant? getFavRestaurant(String id) {
    List<dynamic>? data = _box.read('data');
    if (data == null) {
      return null;
    } else {
      List<DetailRestaurant> list = data
          .map((e) => DetailRestaurant.fromJson(e as Map<String, dynamic>))
          .toList();
      return list.firstWhereOrNull((element) => element.id == id);
    }
  }

  void deleteRestaurant(DetailRestaurant detail) {
    List<dynamic>? data = _box.read('data');
    if (data != null) {
      Map<String, dynamic>? resto = data.firstWhereOrNull(
        (element) => element["id"] == detail.id,
      );
      if (resto != null) {
        data.removeWhere(
          (element) => element["id"] == detail.id,
        );
        _box.write('data', data);
      }
    }
  }
}
