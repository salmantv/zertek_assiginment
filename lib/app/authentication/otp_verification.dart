import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../user_checking/views/user_checking_view.dart';

class OtpPageController extends GetxController {
  verifyOTPandsignIn(String otp, String verificationID) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: otp);
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        Get.offAll(UserCheckingView());
        log("Signed IN");
      });
      update();
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      Get.snackbar(e.toString(), "");
    } catch (exception) {
      Get.snackbar(exception.toString(), "");
    }
  }
}
