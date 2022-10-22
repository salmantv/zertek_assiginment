import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zertektask/app/authentication/google_login.dart';

class DrawerHomescreen extends StatelessWidget {
  DrawerHomescreen({
    Key? key,
  }) : super(key: key);

  final currentUser = FirebaseAuth.instance.currentUser;
  final auth = FirebaseAuth.instance;
  final googlecontroller = Get.put(GoogleLogin());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: 250,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipOval(
                    child: CircleAvatar(
                      radius: 36,
                      child: currentUser!.photoURL == null
                          ? Image.network(
                              "https://png.pngtree.com/png-vector/20190719/ourlarge/pngtree-no-photo-icon-png-image_1557651.jpg",
                              fit: BoxFit.cover,
                              width: 100,
                            )
                          : Image.network(
                              currentUser!.photoURL.toString(),
                              width: 250,
                            ),
                    ),
                  ),
                  currentUser?.displayName == null
                      ? Text(
                          currentUser!.phoneNumber.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2),
                        )
                      : Text(currentUser!.displayName!.toString()),
                ],
              ),
            ),
            InkWell(
              onTap: () async {},
              child: SizedBox(
                height: 80,
                child: GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    auth.signOut();
                    if (googlecontroller.googleSignin.currentUser != null) {
                      await googlecontroller.googleSignin.signOut();
                    }
                  },
                  child: const ListTile(
                    leading: Icon(Icons.login),
                    title: Text("Log out"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
