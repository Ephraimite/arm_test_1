import 'dart:developer';

import 'package:arm_test_1/app/app.router.dart';
import 'package:arm_test_1/ui/views/signup/signup_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../common/snackbar/setup_snackbar_ui.dart';

class SignupViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final snackBarService = locator<SnackbarService>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
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

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  User? user;

  Future<void> get getCurrentUser async {
    user = _auth.currentUser;
  }

  signUpUser(String email, String password) async {
    setBusy(true);
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (authResult.user != null) {
        final newUser = UserModel(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: email,
            userId: authResult.user!.uid,
            password: password);

        await saveUserDetails(newUser);
      }
    } on FirebaseException catch (error) {
      snackBarService.showCustomSnackBar(
        message: error.code,
        variant: SnackBarType.red,
      );
      setBusy(false);
    }
  }

  FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;

  saveUserDetails(UserModel newUser) {
    setBusy(true);
    _firebaseFirestore.collection("Users").doc(newUser.userId).set({
      "User ID": newUser.userId,
      "First Name": newUser.firstName,
      "Last Name": newUser.lastName,
      "Email": newUser.email,
      "Password": newUser.password,
    });
    firebaseAnalytics.logEvent(
        name: "New User Signup event", parameters: newUser.toJson());
    setBusy(false);
    navigationService.navigateToSuccessScreenView(
        title: "User signup successfully",
        btnText: "Proceed to login",
        onTapped: () {
          navigationService.navigateToLoginView();
        });
  }
}
