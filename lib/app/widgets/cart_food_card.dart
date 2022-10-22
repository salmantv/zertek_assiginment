import 'package:flutter/material.dart';
import 'package:zertektask/app/data/model/apimodelClass.dart';

import 'quantitycounter.dart';

class Cartcard extends StatelessWidget {
  const Cartcard({Key? key, required this.data}) : super(key: key);
  final CategoryDishes data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    data.dishName!,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Quantitycounter(
                  data: data,
                ),
                Text(
                  "INR ${data.dishPrice!.toString()}",
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "INR ${data.dishPrice!.toString()}",
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "${data.dishCalories.toString()} Calories",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
