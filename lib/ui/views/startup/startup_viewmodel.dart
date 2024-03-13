
import 'package:arm_test_1/app/app.router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("user persisted: ${user?.email}");
        _navigationService.replaceWithLoginView();
      } else {
        _navigationService.navigateToBottomNavigationView();
      }
    });
  }
}
