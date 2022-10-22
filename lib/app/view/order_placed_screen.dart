import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';

class OrderPlacedscreen extends StatelessWidget {
  OrderPlacedscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(child: Image.asset("assets/image/72243-order-placed.gif"))
      ]),
    );
  }
}
