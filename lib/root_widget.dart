import 'package:flutter/material.dart';
import 'package:stroll_test/ui/features/bonfire_home/presentation/view.dart';

import 'core/gen/colors.gen.dart';

class StrollTestApp extends StatelessWidget {
  const StrollTestApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: StrollColors.primary),
        useMaterial3: true,
      ),
      home: const BonfireHomeView(),
    );
  }
}
