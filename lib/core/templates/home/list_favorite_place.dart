import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_trip/constants/trips_constant.dart';
import 'package:open_trip/core/templates/home/trip_card.dart';
import 'package:open_trip/routes/route_name.dart';
import 'package:open_trip/utils/responsive_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListFavoritePlace extends StatelessWidget {
  const ListFavoritePlace(
      {super.key, required this.title, this.refresh = false});

  final String title;
  final bool refresh;

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
          SizedBox(
              height: 200.w, // Sesuaikan tinggi agar cukup untuk card
              child: AnimationLimiter(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trips.length,
                  itemBuilder: (context, index) {
                    final trip = trips[index];
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(microseconds: 375),
                        child: ScaleAnimation(
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: ResponsiveUtil.getHorizontalPadding(),
                                    right: index + 1 == trips.length
                                        ? ResponsiveUtil.getHorizontalPadding()
                                        : 0),
                                child: TripCard(
                                  imageUrl: trip.photo,
                                  title: trip.title,
                                  price: trip.price,
                                  rating: trip.rating,
                                  reviews: trip.reviews,
                                  type: trip.type,
                                  onTap: () {
                                    if (refresh) {
                                      context.replace(
                                          RootRouteName.detailScreen,
                                          extra: trip);
                                    } else {
                                      context.go(RootRouteName.detailScreen,
                                          extra: trip);
                                    }
                                  },
                                ))));
                  },
                ),
              )),
        ],
      ),
    );
  }
}
