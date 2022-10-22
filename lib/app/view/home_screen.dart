import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zertektask/app/view/phone_screen.dart';
import 'package:zertektask/app/widgets/login_button.dart';

import '../authentication/google_login.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);

  final googlelogincontroller = Get.put(GoogleLogin());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.65,
            width: size.width * 0.60,
            child: Image.asset(
              "assets/image/Firebase-logo.png",
              width: size.width * 0.20,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: size.height * 0.20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(() {
                  return googlelogincontroller.islooging.value == false
                      ? Loginbutton(
                          onpressed: () async {
                            await googlelogincontroller.googleLogin();
                          },
                          name: "Google",
                          iconData: Icons.fmd_good,
                          color: Colors.blue,
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                }),
                Loginbutton(
                  onpressed: () {
                    Get.to(Phonescreen());
                  },
                  name: "Phone",
                  iconData: Icons.call,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
