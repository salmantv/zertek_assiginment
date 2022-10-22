import 'package:flutter/material.dart';
import 'package:zertektask/app/data/model/apimodelClass.dart';
import 'package:zertektask/app/widgets/food_recip_card.dart';

class Listgenerater extends StatelessWidget {
  Listgenerater({Key? key, required this.alldata}) : super(key: key);
  List<CategoryDishes> alldata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView.separated(
              itemBuilder: (context, index) {
                final data = alldata[index];
                return Foodrecipcard(data: data, index: index);
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: alldata.length),
        ),
      ),
    );
  }
}
