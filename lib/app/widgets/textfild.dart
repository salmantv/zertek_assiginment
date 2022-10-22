import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zertektask/app/authentication/phone_number_verification.dart';

class PhoneNumberTextfild extends StatelessWidget {
  PhoneNumberTextfild({Key? key}) : super(key: key);
  final phonecontroller = Get.put(Phoneverification());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.10),
          child: SizedBox(
            width: size.width * 0.80,
            child: Card(
              elevation: 6,
              color: Colors.white,
              child: TextField(
                controller: phonecontroller.phonetext,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Number ",
                  hintStyle: const TextStyle(fontSize: 14),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.phone,
                      color: Colors.grey,
                      size: 22,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 230, 234, 237)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
