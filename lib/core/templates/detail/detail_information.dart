import 'package:flutter/material.dart';
import 'package:open_trip/core/themes/colors.dart';
import 'package:open_trip/models/TripDataModel.dart';
import 'package:open_trip/utils/responsive_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailInformation extends StatelessWidget {
  const DetailInformation({super.key, required this.tripModel});
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
              "Informasi Penting",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.w),

            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Agar titik bullet sejajar
              children: [
                Text("•",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.textDisable)),
                SizedBox(width: 8.w),
                Expanded(
                  // Menyesuaikan teks agar tidak overflow
                  child: Text(
                    "Termasuk : ${tripModel.includes.join(", ")}",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorPalette.textDisable,
                        fontWeight: FontWeight.w500),
                    softWrap:
                        true, // Membantu agar teks tidak keluar dari batas
                    overflow: TextOverflow.clip, // Menghindari overflow
                  ),
                ),
              ],
            ),

            SizedBox(height: 8.w), // Jarak antar item

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("•",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.textDisable)),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    "Tidak Termasuk : ${tripModel.excludes.join(", ")}",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorPalette.textDisable,
                        fontWeight: FontWeight.w500),
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
