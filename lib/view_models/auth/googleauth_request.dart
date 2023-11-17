import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:traacka/initialize_singletons.dart';
import 'package:traacka/main.dart';
import 'package:traacka/views/homepage/homepage.dart';
import 'package:traacka/views/widgets/navigation.dart';
import 'package:traacka/views/widgets/progress_indicator.dart';

class Auth {
  signInWithGoogle() async {
    progressIndicator(message: "Signing IN...");
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);
        UserCredential result =
            await firebaseAuth.signInWithCredential(authCredential);
        User? user = result.user;
        $google.updateUserDetails(user);

        navigateReplaceToPage(const HomePage());
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        showErrorDialog(
            navigatorKey!.currentContext!, e.message!, "Error Occured", "Retry",
            () {
          hideProgressIndicator();
        });
      }
    }
  }
}
