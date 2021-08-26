import 'package:biys/data/model/detail_restaurant.dart';
import 'package:get_storage/get_storage.dart';
import 'package:collection/collection.dart';

class LocalStorage {
  void setNotif(bool value) {
    GetStorage _box = GetStorage("favorite");
    _box.write('notif', value);
  }

  bool getNotif() {
    GetStorage _box = GetStorage("favorite");
    bool? data = _box.read('notif');
    if (data == null) {
      return false;
    } else {
      print("data : $data");
      return data;
    }
  }

  addRestaurant(DetailRestaurant detail) {
    GetStorage _box = GetStorage("favorite");
    List<dynamic>? data = _box.read('data');
    if (data == null) {
      _box.write('data', [detail.toJson()]);
    } else {
      data.add(detail.toJson());
      _box.write('data', data);
    }
  }

  List<DetailRestaurant>? getAllRestaurant() {
    GetStorage _box = GetStorage("favorite");
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
    GetStorage _box = GetStorage("favorite");
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
    GetStorage _box = GetStorage("favorite");
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
    GetStorage _box = GetStorage("favorite");
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
