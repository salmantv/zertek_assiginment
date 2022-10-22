import 'package:get/get.dart';
import 'package:zertektask/app/user_checking/views/user_checking_view.dart';
import 'package:zertektask/app/view/order_placed_screen.dart';

import '../data/model/apimodelClass.dart';

class Cartcontroller extends GetxController {
  Rx<List<DishesModel>> getalldata = Rx([]);
  Rx<int> totelamount = Rx(0);
  Rx<int> totelcartcount = Rx(0);
  Rx<List<CategoryDishes>> cartaddedvalues = Rx([]);

  void gettotelamount() async {
    for (var i = 0; i < cartaddedvalues.value.length; i++) {
      totelamount.value += cartaddedvalues.value[i].dishPrice!.toInt();
    }
  }

  Future<void> placeordered() async {
    if (totelcartcount.value == 0) {
      Get.snackbar("Sorry", "Cart is emptiy ");
      return;
    }
    cartaddedvalues.value.clear();
    totelcartcount.value = 0;
    totelamount.value = 0;
    update();
    Get.to(OrderPlacedscreen());
    Future.delayed(const Duration(milliseconds: 3600)).then((value) {
      Get.offAll(UserCheckingView());
    });
  }

  void addtocartandquantity(CategoryDishes dishes) {
    if (cartaddedvalues.value.contains(dishes)) {
      dishes.quantity = (dishes.quantity! + 1);
    } else {
      cartaddedvalues.value.add(dishes);
      dishes.quantity = 1;
      totelcartcount.value = cartaddedvalues.value.length;
    }
    update();
  }

  void removetocartandquantity(CategoryDishes dishes) {
    if (cartaddedvalues.value.contains(dishes)) {
      if (dishes.quantity! <= 1) {
        dishes.quantity = 0;
        cartaddedvalues.value.remove(dishes);
      } else {
        dishes.quantity = dishes.quantity! - 1;
      }
      update();
    }
  }
}
