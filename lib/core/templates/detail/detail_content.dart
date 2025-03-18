import 'package:flutter/material.dart';
import 'package:open_trip/core/themes/colors.dart';
import 'package:open_trip/models/TripDataModel.dart';
import 'package:open_trip/utils/format_currency.dart';
import 'package:open_trip/utils/responsive_util.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({super.key, required this.tripModel});

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
              "Detail",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12.w,
            ),
            Row(
              children: [
                Text("•",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.textDisable)),
                SizedBox(
                  width: 8.w,
                ),
                Text("Harga : ${formatCurrency(tripModel.price)}",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorPalette.textDisable,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            Row(
              children: [
                Text("•",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.textDisable)),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                    "Total Pax : Min. ${tripModel.totalPax.min},Max ${tripModel.totalPax.max}",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorPalette.textDisable,
                        fontWeight: FontWeight.w500)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
