import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.scaffoldBackgroundColor,
      child: Hero(
        tag: "app-logo",
        child: Column(
          children: [
            Images.logoSmall.assetImage(width: .6.sw).centered(),
            divider.w(.3.sw).centered(),
          ],
        ),
      ),
    );
  }
}
