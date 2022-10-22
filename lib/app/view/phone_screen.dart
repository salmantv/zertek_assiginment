import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zertektask/app/authentication/phone_number_verification.dart';
import 'package:zertektask/app/widgets/textfild.dart';

class Phonescreen extends StatelessWidget {
  Phonescreen({Key? key}) : super(key: key);
  final phonenumbercontroller = Get.put(Phoneverification());
  final phonenumberText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: const Color.fromARGB(255, 247, 250, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.10),
                child: Row(
                  children: const [
                    Text(
                      "Welcome",
                      style: TextStyle(fontSize: 15, letterSpacing: 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.10),
                child: Row(
                  children: const [
                    Text(
                      "Fill the form to become \nour guest",
                      style: TextStyle(
                          fontSize: 22,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
          PhoneNumberTextfild(),
          GestureDetector(
            onTap: () async {
              await phonenumbercontroller.verfiyphonenumber(
                "+91 ${phonenumbercontroller.phonetext.text}",
              );
              // Get.to(OTPscreen());
            },
            child: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 43, 57, 88),
              radius: 30,
              child: Center(
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
