import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stroll_test/core/config/module/base_view_model.dart';
import 'package:stroll_test/core/utils/extensions.dart';

class DashboardShellViewModel extends BaseViewModel {
  late Size size;

  init(BuildContext context, StatefulNavigationShell c) {
    size = context.mediaQuery.size;

    currentIndex = c.currentIndex;
  }

  int _index = 0;
  int get currentIndex => _index;
  set currentIndex(int i) {
    _index = i;
    notifyListeners();
  }

  goToPage(BuildContext context, int index) async {}
}
