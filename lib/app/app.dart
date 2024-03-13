import 'package:arm_test_1/services/app_storage_service_service.dart';
import 'package:arm_test_1/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:arm_test_1/ui/views/home/home_view.dart';
import 'package:arm_test_1/ui/views/home/home_viewmodel.dart';
import 'package:arm_test_1/ui/views/login/login_viewmodel.dart';
import 'package:arm_test_1/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:arm_test_1/ui/views/login/login_view.dart';
import '../ui/bottom_sheets/notice/notice/notice_sheet.dart';
import 'package:arm_test_1/ui/views/bottom_navigation/bottom_navigation_view.dart';
import 'package:arm_test_1/ui/views/chat/chat_view.dart';
import 'package:arm_test_1/ui/views/profile/profile_view.dart';
import 'package:arm_test_1/ui/views/signup/signup_view.dart';
import 'package:arm_test_1/ui/views/success_screen/success_screen_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: BottomNavigationView),
    MaterialRoute(page: ChatView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: SuccessScreenView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AppStorageServiceService),

    LazySingleton(classType: HomeViewModel),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: LoginViewModel),

    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
