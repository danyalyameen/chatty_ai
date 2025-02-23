import 'dart:developer';

import 'package:chatty_ai/App/app.locator.dart';
import 'package:chatty_ai/App/app.router.dart';
import 'package:chatty_ai/Constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthService {
  // Firebase Auth Instance
  FirebaseAuth auth = FirebaseAuth.instance;
  // Navigation Service
  NavigationService navigationService = locator<NavigationService>();
  Future<void> signUp({required String email, required String password}) async {
    // Signup User
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> login({required String email, required String password}) async {
    // Login User
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> passwordResetLink({required String email}) async {
    // Send Verification Link
    await auth.sendPasswordResetEmail(email: email);
  }

  // Get User Info
  User? getUser() {
    return auth.currentUser;
  }

  // Logout User
  Future<void> logout() async {
    // Logout User
    await auth.signOut();
    // Save Logged Out
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(Constants.loggedIn, false);
    // Navigation
    navigationService.replaceWithLoginView();
  }

  void googleAuth() async {
    try {
      // Get User Account
      GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
      if (googleSignInAccount == null) {
        return null;
      }
      // Request For Authentication
      GoogleSignInAuthentication authentication =
          await googleSignInAccount.authentication;
      // Get User Credentials
      var credentials = GoogleAuthProvider.credential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken);
      // Signup User
      await auth.signInWithCredential(credentials);
      // Save Logged In
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setBool(Constants.loggedIn, true);
      // Navigation
      navigationService.replaceWithCompleteProfileView();
    } catch (e) {
      log(e.toString());
    }
  }
}
