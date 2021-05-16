import 'package:flutter/material.dart';

class MenuChangeNotifier extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey {
    return _scaffoldKey;
  }

  int get index => _index;
  int _index = 0;

  void selectIndex(int index) {
    _index = index;
    notifyListeners();
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState.isDrawerOpen) {
      _scaffoldKey.currentState.openDrawer();
    }
  }
}
