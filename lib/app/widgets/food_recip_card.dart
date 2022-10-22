import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zertektask/app/data/model/apimodelClass.dart';
import 'package:zertektask/app/service/api_intgartion.dart';
import 'package:zertektask/app/widgets/quantitycounter.dart';

import '../view_model/main_home_controller.dart';

class Foodrecipcard extends StatelessWidget {
  Foodrecipcard({Key? key, required this.data, required this.index})
      : super(key: key);

  final CategoryDishes data;
  final cartcontroller = Get.put(Homecontroller());

  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Homecontroller>(builder: (controller) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            color: Colors.white,
            // height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: Colors.black)),
                        child: Center(
                          child: Container(
                            height: 7,
                            width: 7,
                            color: data.dishAvailability == true
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: SizedBox(
                          width: 220,
                          child: Text(
                            data.dishName!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "SAR ${data.dishPrice!.toString()}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Flexible(
                        child: Text(
                          "${data.dishCalories!.toString()} calories",
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Image.network(
                        "https://www.acouplecooks.com/wp-content/uploads/2020/12/Honey-Garlic-Shrimp-026.jpg",
                        fit: BoxFit.contain,
                        width: 60,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          width: 220,
                          child: Text(data.dishDescription!),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Quantitycounter(data: data),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
