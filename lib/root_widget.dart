import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroll_test/core/navigation/routes/base_router.dart';

import 'core/gen/colors.gen.dart';

class StrollTestApp extends StatelessWidget {
  const StrollTestApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: StrollColors.primary),
        useMaterial3: true,
      ),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
            textScaler: MediaQuery.of(context)
                .textScaler
                .clamp(minScaleFactor: 0.9, maxScaleFactor: 1.0)),
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          useInheritedMediaQuery: true,
          builder: (context, child) => child ?? const SizedBox.shrink(),
        ),
      ),
    );
  }
}
