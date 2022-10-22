import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin extends GetxController {
  Rx<bool> islooging = Rx(false);

  final googleSignin = GoogleSignIn();
  GoogleSignInAccount? user;

  Future googleLogin() async {
    islooging.value = true;
    final googleuser = await googleSignin.signIn();
    if (googleuser == null) {
      islooging.value = false;
      return;
    }
    user = googleuser;

    final googleaut = await googleuser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleaut.accessToken,
      idToken: googleaut.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    islooging.value = false;
    update();
  }
}
