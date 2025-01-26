import 'package:flutter/material.dart';
import 'package:stroll_test/core/gen/assets.gen.dart';
import 'package:stroll_test/core/utils/extensions.dart';

class NavBarItem extends StatelessWidget {
  final Function onTap;
  final int index;
  final int currentIncex;
  const NavBarItem({
    super.key,
    required this.onTap,
    required this.index,
    this.currentIncex = 0,
  });

  Widget icon() {
    switch (index) {
      case 0:
        return StrollAssets.images.svg.card.svg();
      case 1:
        return StrollAssets.images.svg.bonfire.svg();
      case 2:
        return StrollAssets.images.svg.chat.svg();
      case 3:
        return StrollAssets.images.svg.user.svg();
      default:
        return StrollAssets.images.svg.card.svg();
    }
  }

  bool isActive() {
    return index == currentIncex;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1500),
        width: context.mediaQuery.size.width / 6,
        decoration: const BoxDecoration(),
        child: icon(),
      ),
    );
  }
}
