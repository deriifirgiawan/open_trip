import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:open_trip/constants/trips_constant.dart';
import 'package:open_trip/core/templates/home/trip_card.dart';
import 'package:open_trip/core/themes/colors.dart';
import 'package:open_trip/models/TripDataModel.dart';
import 'package:open_trip/routes/route_name.dart';
import 'package:open_trip/utils/format_currency.dart';
import 'package:open_trip/utils/get_total_price.dart';
import 'package:open_trip/utils/responsive_util.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CartViewState();
  }
}

class _CartViewState extends State<CartView> {
  List<TripModel> _selectedTrip = [];

  void addToSelected(TripModel item) {
    setState(() {
      bool exists = _selectedTrip.any((trip) => trip.id == item.id);

      if (exists) {
        _selectedTrip.removeWhere((trip) => trip.id == item.id);
      } else {
        _selectedTrip = [..._selectedTrip, item];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          if (context.canPop()) {
            return context.pop();
          }
          return context.go(RootRouteName.homeScreen);
        }

        return context.go(RootRouteName.homeScreen);
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "Keranjang",
                style:
                    TextStyle(fontSize: 16.sp, color: ColorPalette.textPrimary),
              ),
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.chevron_left,
                  color: ColorPalette.textPrimary,
                ),
              ),
            ),
            body: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveUtil.getHorizontalPadding(),
                vertical: 12.w,
              ),
              itemCount: trips.length,
              itemBuilder: (context, index) {
                final trip = trips[index];

                return Padding(
                  padding:
                      EdgeInsets.only(bottom: 8), // Tambahkan jarak antar item
                  child: TripCard(
                    typeCardSize: TypeCardSize.small,
                    imageUrl: trip.photo,
                    title: trip.title,
                    price: trip.price,
                    rating: trip.rating,
                    reviews: trip.reviews,
                    type: trip.type,
                    typeCard: TypeCard.order,
                    isSelected: _selectedTrip.any((item) => item.id == trip.id),
                    onTap: () => {addToSelected(trip)},
                  ),
                );
              },
            ),
            bottomNavigationBar: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveUtil.getHorizontalPadding(),
                      vertical: 12.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600)),
                          Text(formatCurrency(getTotalPrice(_selectedTrip)),
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold))
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () => {
                                if (_selectedTrip.isNotEmpty)
                                  {
                                    context.push(
                                        RootRouteName.orderPaymentScreen,
                                        extra: _selectedTrip)
                                  }
                              },
                          child: Text("Bayar Sekarang"))
                    ],
                  )),
            )),
      ),
    );
  }
}
