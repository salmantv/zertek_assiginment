import 'package:get/get.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:zertektask/app/view_model/main_home_controller.dart';

import '../data/model/apimodelClass.dart';

class Apihelperclass {
  final homecontroller = Get.put(Homecontroller());
  Future<List<DishesModel>> getingrecipedata() async {
    try {
      final dio = Dio();
      const apiUrl = "https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad";
      var response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        Iterable list = await response.data;
        return list.map((element) => DishesModel.fromJson(element)).toList();
      }
    } catch (e) {
      log(e.toString());
    }

    return <DishesModel>[];
  }
}
