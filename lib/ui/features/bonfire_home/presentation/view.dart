import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroll_test/core/config/module/base_screen.dart';
import 'package:stroll_test/core/gen/assets.gen.dart';
import 'package:stroll_test/core/gen/colors.gen.dart';
import 'package:stroll_test/core/gen/fonts.gen.dart';

import 'view_model.dart';

class BonfireHomeView extends StatelessWidget {
  const BonfireHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<BonfireHomeViewModel>(
        model: BonfireHomeViewModel(),
        onModelReady: (model) => model.init(context),
        builder: (context, model, _) {
          return Scaffold(
            backgroundColor: StrollColors.black,
            body: Stack(
              children: [
                StrollAssets.images.png.sunset.image(
                  fit: BoxFit.fitWidth,
                ),
                SafeArea(child: body(context))
              ],
            ),
          );
        });
  }

  Container body(BuildContext context) => Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              StrollColors.gradient64.withOpacity(0.7),
              StrollColors.black,
            ],
            stops: const [0.4, 0.5, 1.0], // Adjust the fade transition
          ),
        ),
        child: Column(
          children: [
            Text(
              'Stroll Bonfire',
              style: TextStyle(
                fontFamily: StrollFonts.proximaNova,
                color: StrollColors.largeTitleWhite,
                fontSize: 34.sp,
              ),
            )
          ],
        ),
      );
}
