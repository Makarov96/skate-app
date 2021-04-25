import 'package:flutter/cupertino.dart';

class OffsetNotifier extends ChangeNotifier {
  double _page = 0;
  double get page => this._page;

  set page(double value) {
    this._page = value;

    notifyListeners();
  }

  void updatePage(double myOffsetPage) {
    _page = myOffsetPage;

    notifyListeners();
  }
}
