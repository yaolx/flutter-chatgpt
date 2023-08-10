import 'package:flutter/material.dart';

class PageReducer extends ChangeNotifier {
  int _curPage = 0;

  int get curPage => _curPage;

  void setPage(index) {
    _curPage = index;
    notifyListeners();
  }
}
