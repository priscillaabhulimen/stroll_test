import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

extension BuildContextEx on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double getHeight([double scale = 1]) => mediaQuery.size.height * scale;
  double getWidth([double scale = 1]) => mediaQuery.size.width * scale;

  void popUntilPath<T extends Object?>(String ancestorPath, [T? result]) {
    while (GoRouter.of(this)
            .routerDelegate
            .currentConfiguration
            .matches
            .last
            .matchedLocation !=
        ancestorPath) {
      if (!canPop()) {
        return;
      }
      pop(result);
    }
  }
}

extension Gap on num {
  Widget get verticalGap => SizedBox(
        height: toDouble().h,
      );
  Widget get horizontalGap => SizedBox(
        width: toDouble().w,
      );
}

extension StringEx on String? {
  String get orEmpty => this ?? "";
  String get sentenceCase => orEmpty.trim().isNotEmpty
      ? orEmpty[0].toUpperCase() + orEmpty.substring(1).toLowerCase()
      : "";
  String get initials => orEmpty.trim().isNotEmpty
      ? "${this!.trimRight().split(" ").first[0].toUpperCase()}${this!.trimRight().split(" ").length > 1 ? this!.trimRight().split(" ").last[0].toUpperCase() : ""}"
      : "";
  String get nameCase => orEmpty.trim().isNotEmpty
      ? "${this!.trimRight().split(" ").first.sentenceCase}${this!.trimRight().split(" ").length > 1 ? " ${this!.trimRight().split(" ").last.sentenceCase}" : ""}"
      : "";

  String get routeSplitter => orEmpty.split('/').last;

  String? get orNull => orEmpty.isEmpty ? null : orEmpty;
}

extension GestureEx on Widget {
  Widget onTap(VoidCallback action) => GestureDetector(
        onTap: action,
        child: this,
      );
}

extension PxToLineHeight on num {
  double toLineHeight(double fontSize) {
    return sp / fontSize.sp;
  }

  double toLetterSpacing(double fontsize) {
    return sp * fontsize.sp;
  }
}
