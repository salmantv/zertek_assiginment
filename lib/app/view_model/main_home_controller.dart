import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zertektask/app/user_checking/views/user_checking_view.dart';
import 'package:zertektask/app/view/order_placed_screen.dart';
import 'package:zertektask/app/widgets/dish_tail_generater.dart';

import '../data/model/apimodelClass.dart';
import '../service/api_intgartion.dart';

class Homecontroller extends GetxController {
  Rx<List<DishesModel>> getalldata = Rx([]);
  Rx<List<Widget>> tabnames = Rx([]);
  Rx<List<Widget>> tabsview = Rx([]);

  // addtocartandquantity(CategoryDishes categoryDishes) {
  //   if (cartaddedvalues.value.contains(categoryDishes)) {
  //     categoryDishes.quantity = (categoryDishes.quantity! + 1);
  //   } else {
  //     cartaddedvalues.value.add(categoryDishes);
  //     categoryDishes.quantity = 0;
  //     totelcartcount.value = cartaddedvalues.value.length;
  //   }
  //   update();
  // }

  // removetocartandquantity(CategoryDishes categoryDishes) {
  //   if (cartaddedvalues.value.contains(categoryDishes)) {
  //     if (categoryDishes.quantity! <= 1) {
  //       categoryDishes.quantity = 0;
  //       cartaddedvalues.value.remove(categoryDishes);
  //     } else {
  //       categoryDishes.quantity = categoryDishes.quantity! - 1;
  //     }
  //     update();
  //   }
  // }

  // Future<void> placeordered() async {
  //   if (totelcartcount.value == 0) {
  //     Get.snackbar("Sorry", "Cart is emptiy ");
  //     return;
  //   }
  //   cartaddedvalues.value.clear();
  //   totelcartcount.value = 0;
  //   update();
  //   Get.to(OrderPlacedscreen());
  //   Future.delayed(const Duration(milliseconds: 3600)).then((value) {
  //     Get.offAll(UserCheckingView());
  //   });
  // }

  Future<List<DishesModel>> apicalling() async {
    getalldata.value = await Apihelperclass().getingrecipedata();
    tabnames.value.clear();
    for (TableMenuList element in getalldata.value.first.tableMenuList) {
      tabnames.value.add(
        Text(element.menuCategory),
      );
      update();
    }
    await createTabViews();
    update();
    return getalldata.value;
  }

  createTabViews() async {
    try {
      tabsview.value.clear();
      for (var element in getalldata.value.first.tableMenuList) {
        tabsview.value.add(Listgenerater(alldata: element.categoryDishes!));
        update();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
