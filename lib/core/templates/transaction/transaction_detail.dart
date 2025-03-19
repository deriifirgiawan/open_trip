import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_trip/core/themes/colors.dart';
import 'package:open_trip/models/TripDataModel.dart';
import 'package:open_trip/utils/format_currency.dart';
import 'package:open_trip/utils/get_total_price.dart';
import 'package:open_trip/utils/responsive_util.dart';

class TransactionDetail extends StatelessWidget {
  const TransactionDetail({super.key, required this.listTrip});
  final List<TripModel> listTrip;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveUtil.getHorizontalPadding(), vertical: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Detail Informasi",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: listTrip.map((trip) {
              return Padding(
                  padding: EdgeInsets.only(top: 12.w),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 12.w),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          trip.title,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorPalette.textDisable,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8.w),
                        Text(
                          formatCurrency(trip.price),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorPalette.textDisable,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ));
            }).toList(),
          ),
          SizedBox(
            height: 12.w,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total:",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                formatCurrency(getTotalPrice(listTrip)),
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
