import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zertektask/app/authentication/otp_verification.dart';
import 'package:zertektask/app/view/otp_screen.dart';

class Phoneverification extends GetxController {
  final otpcontroller = Get.put(OtpPageController());
  TextEditingController phonetext = TextEditingController();

  Future<void> verfiyphonenumber(String userphonenumber) async {
    if (userphonenumber.isEmpty) {
      return;
    }
    try {
      await FirebaseAuth.instance
          .verifyPhoneNumber(
            phoneNumber: userphonenumber,
            verificationCompleted:
                (PhoneAuthCredential phoneAuthCredential) async {
              log(phoneAuthCredential.smsCode.toString());
              await FirebaseAuth.instance
                  .signInWithCredential(phoneAuthCredential);
            },
            verificationFailed:
                (FirebaseAuthException firebaseAuthException) async {
              Get.snackbar("Error", firebaseAuthException.message.toString(),
                  backgroundColor: Colors.white, colorText: Colors.black);
            },
            codeSent: (String verificationID, [int? forceResendingToken]) {
              Get.to(OTPscreen(
                verificationid: verificationID,
              ));
              Get.snackbar("OTP Sended", "OTP is sent to Your Mobile Number",
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.white,
                  colorText: Colors.black);
            },
            codeAutoRetrievalTimeout: (String verificationId) async {},
          )
          .then((value) {})
          .onError((error, stackTrace) {
        Get.snackbar("Error", error.toString());
      });
    } catch (e) {
      Get.snackbar("Error", "Somthing Wrong");
    }
  }
}
