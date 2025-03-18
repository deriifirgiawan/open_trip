import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveUtil {
  static double getHorizontalPadding() {
    return 1.sw > 430.w ? 24.w : 16.w;
  }
}
