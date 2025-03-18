import 'package:flutter/material.dart';
import 'package:open_trip/core/themes/colors.dart';
import 'package:open_trip/models/TripDataModel.dart';
import 'package:open_trip/utils/responsive_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key, required this.tripModel});

  final TripModel tripModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveUtil.getHorizontalPadding(), vertical: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tripModel.title,
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 8.w,
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 16.sp),
                SizedBox(width: 4.w),
                Text(
                  "${tripModel.rating}",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  "${tripModel.reviews} Reviews",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.w,
            ),
            Text(
              tripModel.description,
              style:
                  TextStyle(fontSize: 14.sp, color: ColorPalette.textDisable),
            ),
          ],
        ),
      ),
    );
  }
}
