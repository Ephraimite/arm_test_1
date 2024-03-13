import 'package:stacked/stacked.dart';

class BottomNavigationViewModel extends BaseViewModel {
  int currentIndex = 0;

  void updateCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
