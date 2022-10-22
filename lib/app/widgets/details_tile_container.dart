import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zertektask/app/data/model/apimodelClass.dart';
import 'package:zertektask/app/view_model/main_home_controller.dart';
import 'package:zertektask/app/widgets/text_customized.dart';

class DetailsTileCustomContainer extends StatelessWidget {
  DetailsTileCustomContainer(
      {Key? key, required this.data, required this.index})
      : super(key: key);

  final CategoryDishes data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Homecontroller>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.lens_sharp,
              color: index.isEven ? Colors.green : Colors.red,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustomized(
                    fontSize: 20,
                    text: data.dishName!,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextCustomized(
                        fontSize: 16,
                        text: "INR ${data.dishPrice}",
                        fontWeight: FontWeight.bold,
                      ),
                      TextCustomized(
                        fontSize: 16,
                        text: "${data.dishCalories!.round()} Calories",
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextCustomized(
                    fontSize: 14,
                    text: data.dishDescription!,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.black45,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 40,
                    width: 120,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GetBuilder<Homecontroller>(builder: (context) {
                            return TextCustomized(
                              fontSize: 16,
                              text: data.quantity.toString(),
                              fontWeight: FontWeight.bold,
                              textColor: Colors.white,
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextCustomized(
                    fontSize: 16,
                    text: data.addonCat!.isNotEmpty
                        ? "Customizations available"
                        : "",
                    // fontWeight: FontWeight.bold,
                    textColor: Colors.red,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 90,
              width: 90,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/IndianDishes.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
