import 'package:flutter/cupertino.dart';

class MenuController extends ChangeNotifier {
  int _menuIndex = 0;

  int get menuIndex => _menuIndex;

  PageController? pageController;

  void setController(PageController c) {
    pageController = c;
    _menuIndex = c.initialPage;
  }

  bool isSelected(int index) => _menuIndex == index;

  set menuIndex(int menuIndex) {
    _menuIndex = menuIndex;
    notifyListeners();
    // if (pageController?.hasClients ?? false) {
    //   pageController!.jumpToPage(_menuIndex);
    // }
  }
}
