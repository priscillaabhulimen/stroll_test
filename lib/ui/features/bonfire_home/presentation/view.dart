import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroll_test/core/config/module/base_screen.dart';
import 'package:stroll_test/core/gen/assets.gen.dart';
import 'package:stroll_test/core/gen/colors.gen.dart';
import 'package:stroll_test/core/gen/fonts.gen.dart';
import 'package:stroll_test/core/models/option.dart';
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
                  child: body(context, model),
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

  Container body(BuildContext context, BonfireHomeViewModel model) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            StrollColors.gradient64.withOpacity(0.85),
            StrollColors.black,
          ],
          stops: const [0.5, 0.55, 1.0], // Adjust the fade transition
        ),
      ),
      child: Column(
        children: [
          strollBonfireText(),
          countdownText(),
          const Spacer(),
          Stack(
            children: [
              Positioned(
                left: 55.dm,
                top: 15.h,
                child: Container(
                  height: 20.h,
                  width: 100.w,
                  padding: EdgeInsets.only(right: 12.w),
                  decoration: BoxDecoration(
                    color: StrollColors.darkGrey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                  ),
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Angeline, 28',
                    style: TextStyle(
                      color: StrollColors.smallTitleWhite,
                      fontSize: 11.sp,
                      height: 13.4.toLineHeight(11),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 117.h,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 14.w),
                        child: Row(
                          children: [
                            Container(
                              height: 60.dm,
                              width: 60.dm,
                              decoration: const BoxDecoration(
                                color: StrollColors.darkGrey,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(5.dm),
                              child: CircleAvatar(
                                backgroundImage:
                                    StrollAssets.images.png.avatar.provider(),
                                backgroundColor: StrollColors.gradient80,
                              ),
                            ),
                            4.verticalGap,
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.w, top: 40.h, right: 24.w),
                                child: Column(
                                  children: [
                                    Text(
                                      'What is your favourite time of the day?',
                                      style: TextStyle(
                                        color: StrollColors.smallTitleWhite,
                                        fontSize: 19.sp,
                                        height: 20.4.toLineHeight(20),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    10.verticalGap,
                    Text(
                      '“Mine is definitely the peace in the morning.”',
                      style: TextStyle(
                          color: StrollColors.smallTitleWhite,
                          fontSize: 12.sp,
                          height: 14.4.toLineHeight(12),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ],
          ),
          12.verticalGap,
          optionsSection(model),
          12.verticalGap,
          lastRow()
        ],
      ),
    );
  }

  Container optionsSection(BonfireHomeViewModel model) {
    return Container(
      height: 125.h,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          mainAxisExtent: 57.h,
        ),
        itemCount: model.options.length,
        itemBuilder: (context, i) {
          bool isSelected = i == model.optionIndex;
          return optionTile(isSelected, model.options[i]).onTap(() {
            model.optionIndex = i;
          });
        },
      ),
    );
  }

  Container optionTile(bool isSelected, OptionObject item) {
    return Container(
      height: 57.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: StrollColors.darkGrey,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isSelected ? StrollColors.primary : StrollColors.darkGrey,
          width: 3.w,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 20.dm,
            width: 20.dm,
            decoration: BoxDecoration(
              color: isSelected ? StrollColors.primary : Colors.transparent,
              border: Border.all(
                color: isSelected
                    ? StrollColors.primary
                    : StrollColors.subtitleWhite,
              ),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              item.id,
              style: TextStyle(
                fontSize: 12.sp,
                height: 14.62.toLineHeight(14),
                fontWeight: FontWeight.w400,
                color: StrollColors.subtitleWhite,
              ),
            ),
          ),
          6.horizontalGap,
          Expanded(
            child: Text(
              item.title,
              style: TextStyle(
                fontSize: 12.5.sp,
                height: 14.7.toLineHeight(14),
                fontWeight: FontWeight.w400,
                color: StrollColors.subtitleWhite,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget lastRow() {
    return Padding(
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
              border: Border.all(color: StrollColors.primary, width: 3.5.w),
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
    );
  }

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
