import 'package:flutter/material.dart';

class Loginbutton extends StatelessWidget {
  Loginbutton({
    Key? key,
    required this.name,
    required this.iconData,
    required this.color,
    required this.onpressed,
  }) : super(key: key);
  String name;
  IconData iconData;
  Color color;
  Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 55,
        width: double.infinity,
        child: ElevatedButton.icon(
          icon: Padding(
            padding: EdgeInsets.only(right: size.width * 0.25),
            child: Icon(iconData),
          ),
          onPressed: onpressed,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)))),
          label: Padding(
            padding: EdgeInsets.only(right: size.width * 0.30),
            child: Text(
              name,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
