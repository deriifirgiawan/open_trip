import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:open_trip/constants/image_constant.dart';
import 'package:open_trip/core/themes/colors.dart';
import 'package:open_trip/routes/route_name.dart';
import 'package:open_trip/utils/responsive_util.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) {
            return context.go(RootRouteName.homeScreen);
          }

          return context.go(RootRouteName.homeScreen);
        },
        child: Scaffold(
            backgroundColor: ColorPalette.primary,
            body: Center(
              child: SvgPicture.asset(ImageConstant.success),
            ),
            bottomNavigationBar: Container(
              width: double.infinity,
              color: Colors.transparent,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveUtil.getHorizontalPadding(),
                      vertical: 12.w),
                  child: ElevatedButton(
                    onPressed: () => context.push(RootRouteName.homeScreen),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.white),
                      side: WidgetStateProperty.all(
                          BorderSide(color: Colors.blue)),
                      foregroundColor: WidgetStateProperty.all(Colors.blue),
                    ),
                    child: Text("Kembali"),
                  )),
            )));
  }
}
