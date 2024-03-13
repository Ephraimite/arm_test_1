import 'package:arm_test_1/app/app.locator.dart';
import 'package:arm_test_1/app/app.router.dart';
import 'package:arm_test_1/services/app_storage_service_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  signOut() async {
    setBusy(true);
    FirebaseAuth.instance.signOut().then((value) => {
          navigationService.navigateToLoginView(),
          locator<AppStorageServiceService>().storage.deleteAll(),
          setBusy(false)
        });
  }
}
