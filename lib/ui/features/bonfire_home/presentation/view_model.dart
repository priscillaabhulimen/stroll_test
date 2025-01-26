import 'package:flutter/material.dart';
import 'package:stroll_test/core/config/module/base_view_model.dart';
import 'package:stroll_test/core/models/option.dart';

class BonfireHomeViewModel extends BaseViewModel {
  init(BuildContext context) {}

  int? _optionIndex;
  int? get optionIndex => _optionIndex;
  set optionIndex(int? i) {
    _optionIndex = i;
    notifyListeners();
  }

  List<OptionObject> options = [
    OptionObject(
      id: 'A',
      title: 'The peace in the early mornings',
    ),
    OptionObject(
      id: 'B',
      title: 'The magical golden hours',
    ),
    OptionObject(
      id: 'C',
      title: 'Wind-down time after dinners',
    ),
    OptionObject(
      id: 'D',
      title: 'The serenity past midnight',
    ),
  ];
}
