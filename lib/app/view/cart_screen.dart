import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zertektask/app/view_model/cart_controller.dart';
import 'package:zertektask/app/view_model/main_home_controller.dart';

import '../widgets/cart_food_card.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final cartcontroller = Get.put(Cartcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: SizedBox(
          height: 40,
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => cartcontroller.placeordered(),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text("Place Order")),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Order Summery",
          style: TextStyle(color: Color.fromARGB(255, 109, 109, 109)),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 5,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<Cartcontroller>(builder: (controller1) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Card(
                    elevation: 6,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 60,
                          color: Colors.green,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "2 Dishes - ${cartcontroller.totelcartcount.toString()} Items"),
                            ],
                          ),
                        ),
                        Obx(() {
                          return Flexible(
                            fit: FlexFit.loose,
                            child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  cartcontroller.cartaddedvalues.value.length,
                              itemBuilder: ((context, index) {
                                final data =
                                    cartcontroller.cartaddedvalues.value[index];
                                return Cartcard(
                                  data: data,
                                );
                              }),
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Divider(),
                                );
                              },
                            ),
                          );
                        }),
                        Obx(() {
                          return SizedBox(
                            height: 80,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Total Amount",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "INR ${cartcontroller.totelamount.value}.00",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
