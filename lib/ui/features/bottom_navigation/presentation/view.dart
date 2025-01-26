import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:stroll_test/core/config/module/base_screen.dart';
import 'package:stroll_test/core/gen/colors.gen.dart';
import 'package:stroll_test/ui/features/bottom_navigation/widgets/navbar_item.dart';

import 'view_model.dart';

class DashboardShellView extends StatefulWidget {
  final StatefulNavigationShell child;
  const DashboardShellView({super.key, required this.child});

  @override
  State<DashboardShellView> createState() => _DashboardShellViewState();
}

class _DashboardShellViewState extends State<DashboardShellView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardShellViewModel>(
      onModelReady: (model) => model.init(context, widget.child),
      model: DashboardShellViewModel(),
      builder: (context, model, _) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            body: SizedBox(
              height: model.size.height,
              width: model.size.width,
              child: widget.child,
            ),
            bottomNavigationBar: bottomNavContainer(model, context),
          ),
        );
      },
    );
  }

  Container bottomNavContainer(
      DashboardShellViewModel model, BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 16.w, right: 16.w, bottom: 28.h, top: 10.h),
      height: 79.h,
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[3],
        color: StrollColors.gradient0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          widget.child.route.branches.length,
          (index) => NavBarItem(
            onTap: () {
              model.goToPage(context, index);
            },
            index: index,
            currentIncex: model.currentIndex,
          ),
        ),
      ),
    );
  }
}
