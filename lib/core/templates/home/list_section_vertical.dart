import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_trip/constants/trips_constant.dart';
import 'package:open_trip/core/templates/home/trip_card.dart';
import 'package:open_trip/routes/route_name.dart';
import 'package:open_trip/utils/responsive_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListSectionVertical extends StatelessWidget {
  const ListSectionVertical({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ResponsiveUtil.getHorizontalPadding()),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 12),
          Column(
            children: trips.map((trip) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveUtil.getHorizontalPadding(),
                    vertical: 8), // Tambahkan jarak antar item
                child: TripCard(
                  typeCardSize: TypeCardSize.small,
                  imageUrl: trip.photo,
                  title: trip.title,
                  price: trip.price,
                  rating: trip.rating,
                  reviews: trip.reviews,
                  type: trip.type,
                  onTap: () {
                    context.go(RootRouteName.detailScreen, extra: trip);
                  },
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
