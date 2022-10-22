import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:zertektask/app/view/home_screen.dart';

import '../../view/main_home_screen.dart';

class UserCheckingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MainHomescreen();
          } else {
            return Homescreen();
          }
        },
      ),
    );
  }
}
