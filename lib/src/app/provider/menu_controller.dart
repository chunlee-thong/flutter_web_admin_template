import 'package:flutter/cupertino.dart';

class MenuController extends ChangeNotifier {
  int _menuIndex = 0;

  int get menuIndex => _menuIndex;

  final PageController pageController = PageController();

  bool isSelected(int index) => _menuIndex == index;

  set menuIndex(int menuIndex) {
    _menuIndex = menuIndex;
    notifyListeners();
    if (pageController.hasClients) {
      pageController.jumpToPage(_menuIndex);
    }
  }
}
