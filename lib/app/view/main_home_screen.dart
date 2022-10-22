import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zertektask/app/service/api_intgartion.dart';
import 'package:zertektask/app/view/cart_screen.dart';
import 'package:zertektask/app/view_model/cart_controller.dart';
import 'package:zertektask/app/view_model/main_home_controller.dart';
import '../data/model/apimodelClass.dart';
import '../widgets/drawer_homescreen.dart';
import 'package:badges/badges.dart';

class MainHomescreen extends StatelessWidget {
  MainHomescreen({Key? key}) : super(key: key);
  final homeController = Get.put(Homecontroller());
  final cartcontroller = Get.put(Cartcontroller());
  @override
  Widget build(BuildContext context) {
    homeController.apicalling();
    return FutureBuilder<List<DishesModel>>(
      future: homeController.apicalling(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Somthing Wrong"));
        } else if (snapshot.hasData) {
          return DefaultTabController(
            initialIndex: 0,
            length: homeController.tabnames.value.length,
            child: Scaffold(
                drawer: DrawerHomescreen(),
                appBar: AppBar(
                  actions: [
                    InkWell(
                      onTap: () {
                        cartcontroller.gettotelamount();
                        Get.to(CartScreen());
                      },
                      child: Obx(() {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
                          child: Badge(
                            badgeContent: Text(
                                cartcontroller.totelcartcount.value.toString()),
                            child: const Icon(Icons.shopping_cart_sharp),
                          ),
                        );
                      }),
                    )
                  ],
                  iconTheme: const IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  bottom: TabBar(
                      isScrollable: true,
                      labelColor: Colors.red[400],
                      unselectedLabelColor: Colors.black45,
                      indicatorColor: Colors.red[400],
                      labelPadding: const EdgeInsets.all(14),
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          wordSpacing: 2),
                      tabs: homeController.tabnames.value),
                ),
                body: GetBuilder<Homecontroller>(builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TabBarView(children: homeController.tabsview.value),
                  );
                })),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
