import 'dart:developer';

import 'package:arm_test_1/app/app.router.dart';
import 'package:arm_test_1/services/app_storage_service_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../common/snackbar/setup_snackbar_ui.dart';

class LoginViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final snackBarService = locator<SnackbarService>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool? isChecked = false;

  updateIsChecked(bool checkbox) {
    isChecked = checkbox;
    log("ischecked: $isChecked");
    notifyListeners();
  }

  bool isObscure = true;
  obscurePassword() {
    isObscure = !isObscure;
    notifyListeners();
  }

  String? _uid;
  String? _email;

  String? get getUid => _uid;

  String? get getEmail => _email;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;
  User? user;

  Future<void> get getCurrentUser async {
    user = _auth.currentUser;
  }

  Future<void> signOut() async {
    _auth.signOut();
  }

  AppStorageServiceService appStorageServiceService = AppStorageServiceService();
  loginUser({required String email, required String password}) async {
    setBusy(true);
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      log("logged in user ${authResult.user?.email}");
      log("logged in user Id ${authResult.user?.uid}");
      firebaseAnalytics
          .logEvent(name: "User_Login", parameters: <String, dynamic>{
        "User_email": authResult.user!.email,
        "isEmailVerified": authResult.user!.emailVerified.toString()
      });
      if(authResult.user != null){
        navigationService.navigateToBottomNavigationView();
      }
    } on FirebaseAuthException catch (error) {
      snackBarService.showCustomSnackBar(
        message: error.code,
        variant: SnackBarType.red,
      );
      setBusy(false);
    }
  }
}
