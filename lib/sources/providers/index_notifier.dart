import 'package:flutter/cupertino.dart';

class IndexNotifier extends ChangeNotifier {
  int _index = 0;
  get index => this._index;

  set index(int value) {
    this._index = value;
    notifyListeners();
  }
}
