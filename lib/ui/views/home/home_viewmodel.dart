import 'dart:developer';

import 'package:arm_test_1/services/app_storage_service_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../common/app_strings.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  AppStorageServiceService appStorageServiceService = AppStorageServiceService();

  String? userName;

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  Future<void> getUserDetails() async {
    final userRef = FirebaseFirestore.instance.collection('Users');
    final firebaseUser = FirebaseAuth.instance.currentUser;
    await userRef.doc(firebaseUser!.uid).get().then((value) {
      log("value: ${value.data()!['First Name']}");
      appStorageServiceService
          .saveUserName(value.data()!['First Name']);
    });
    userName = await appStorageServiceService.getUserName;
    notifyListeners();
  }
}
