import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  bool disposed = false;

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }
}
