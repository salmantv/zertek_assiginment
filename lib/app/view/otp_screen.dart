import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:zertektask/app/authentication/otp_verification.dart';

class OTPscreen extends StatelessWidget {
  OTPscreen({Key? key, required this.verificationid}) : super(key: key);
  final otpvalue = OtpFieldController();
  String verificationid = "";
  String recivedOTP = "";
  final otpcontroller = Get.put(OtpPageController());

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.10, bottom: size.height * 0.02),
                child: Row(
                  children: const [
                    Text(
                      "Verification",
                      style: TextStyle(fontSize: 15, letterSpacing: 2),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.10, bottom: size.height * 0.02),
                child: Row(
                  children: const [
                    Text(
                      "We sent you an SMS code ",
                      style: TextStyle(
                          fontSize: 22,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.10,
                ),
                child: Row(
                  children: const [
                    Text(
                      "On Number : + 91 8943176142",
                      style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 1,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: OTPTextField(
              onCompleted: (value) async {},
              onChanged: (value) async {
                recivedOTP = value;
                if (value.length >= 6) {
                  log("ha");
                  OtpPageController()
                      .verifyOTPandsignIn(recivedOTP, verificationid);
                }
              },
              controller: otpvalue,
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 45,
              style: const TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
            ),
          ),
        ],
      ),
    );
  }
}
