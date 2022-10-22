import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zertektask/app/view_model/cart_controller.dart';

import '../data/model/apimodelClass.dart';

class Quantitycounter extends StatelessWidget {
  Quantitycounter({Key? key, required this.data}) : super(key: key);
  final CategoryDishes data;
  final cartcontroller = Get.put(Cartcontroller());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 33,
        width: 110,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () async {
                cartcontroller.removetocartandquantity(data);
              },
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
                size: 20,
              ),
            ),
            GetBuilder<Cartcontroller>(builder: (context) {
              return Center(
                child: Text(
                  data.quantity == null || data.quantity == 0
                      ? "0"
                      : data.quantity.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }),
            IconButton(
              onPressed: () async {
                cartcontroller.addtocartandquantity(data);
                log("message");
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
