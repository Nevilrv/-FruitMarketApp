import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constant/firebase.dart';

String? email;
String? image;
String? name;
Future<bool> googleServices() async {
  final GoogleSignInAccount? googleSignInAccount =
      await GoogleSignIn().signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
  final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken);
  print('=======>>>>${authCredential}');
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(authCredential);
  User? user = userCredential.user;

  name = user!.displayName;
  image = user.photoURL;
  email = user.email;
  return true;
}

Future googleSignOut() async {
  await googleSignIn.signOut();
}
