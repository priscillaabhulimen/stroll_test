import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroll_test/core/config/module/base_screen.dart';
import 'package:stroll_test/core/gen/assets.gen.dart';
import 'package:stroll_test/core/gen/colors.gen.dart';
import 'package:stroll_test/core/gen/fonts.gen.dart';
import 'package:stroll_test/core/utils/extensions.dart';

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
                linearFade(),
                radialFade(),
                SafeArea(
                  bottom: false,
                  child: body(context),
                )
              ],
            ),
          );
        });
  }

  Container radialFade() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(colors: [
          StrollColors.black.withOpacity(0.045),
          StrollColors.black.withOpacity(0.1072),
          StrollColors.black.withOpacity(0.135),
          StrollColors.black.withOpacity(0.195),
          StrollColors.black.withOpacity(0.24),
        ], stops: const [
          0.045,
          0.1072,
          0.135,
          0.195,
          1
        ]),
      ),
    );
  }

  Container linearFade() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            StrollColors.black.withOpacity(0.4),
            StrollColors.black.withOpacity(0.1234),
            StrollColors.black.withOpacity(0),
          ],
          stops: const [0.02, 0.1, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
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
            strollBonfireText(),
            countdownText(),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 12.h, left: 14.w, right: 14.w),
              child: Row(
                children: [
                  Expanded(
                    child: pickColumn(),
                  ),
                  8.horizontalGap,
                  Container(
                    height: 48.dm,
                    width: 48.dm,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: StrollColors.primary, width: 3.5.w),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      CupertinoIcons.mic_fill,
                      size: 30.sp,
                      color: StrollColors.primary,
                    ),
                  ),
                  4.horizontalGap,
                  Container(
                    height: 48.dm,
                    width: 48.dm,
                    decoration: const BoxDecoration(
                      color: StrollColors.primary,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 30.sp,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );

  Column pickColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pick your option.',
          style: TextStyle(
            fontFamily: StrollFonts.proximaNova,
            color: StrollColors.lightGrey,
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            height: 14.4.toLineHeight(12),
          ),
        ),
        Text(
          'See who has a similar mind.',
          style: TextStyle(
            fontFamily: StrollFonts.proximaNova,
            color: StrollColors.lightGrey,
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            height: 14.4.toLineHeight(12),
          ),
        ),
      ],
    );
  }

  Row countdownText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StrollAssets.images.svg.time.svg(),
        4.horizontalGap,
        Text(
          '22h 00m',
          style: TextStyle(
            fontFamily: StrollFonts.proximaNova,
            color: StrollColors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
            height: 12.toLineHeight(12),
            shadows: kElevationToShadow[1],
          ),
        ),
        8.horizontalGap,
        StrollAssets.images.svg.person.svg(),
        4.horizontalGap,
        Text(
          '103',
          style: TextStyle(
            fontFamily: StrollFonts.proximaNova,
            color: StrollColors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
            height: 12.toLineHeight(12),
            shadows: kElevationToShadow[1],
          ),
        ),
      ],
    );
  }

  Row strollBonfireText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Stroll Bonfire',
          style: TextStyle(
            fontFamily: StrollFonts.proximaNova,
            color: StrollColors.largeTitleWhite,
            fontWeight: FontWeight.w700,
            fontSize: 34.sp,
            height: 41.41.toLineHeight(34),
            shadows: kElevationToShadow[1],
          ),
        ),
        4.horizontalGap,
        Icon(
          Icons.keyboard_arrow_down_rounded,
          color: StrollColors.largeTitleWhite,
          size: 24.sp,
        )
      ],
    );
  }
}
