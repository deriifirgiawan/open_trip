import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_trip/constants/image_constant.dart';

enum AppLogoType { dark, light }

class AppLogo extends StatefulWidget {
  const AppLogo({super.key, this.appLogoType = AppLogoType.dark});

  final AppLogoType appLogoType;

  @override
  State<StatefulWidget> createState() {
    return _AppLogoState();
  }
}

class _AppLogoState extends State<AppLogo> {
  @override
  Widget build(BuildContext context) {
    if (widget.appLogoType == AppLogoType.dark) {
      return SvgPicture.asset(ImageConstant.logoDark);
    }

    return SvgPicture.asset(ImageConstant.logoLight);
  }
}
