import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:open_trip/bloc/cart/cart_cubit.dart';
import 'package:open_trip/core/templates/transaction/transaction_detail.dart';
import 'package:open_trip/core/templates/transaction/transcation_method.dart';
import 'package:open_trip/core/themes/colors.dart';
import 'package:open_trip/models/TripDataModel.dart';
import 'package:open_trip/routes/route_name.dart';
import 'package:open_trip/utils/format_currency.dart';
import 'package:open_trip/utils/get_total_price.dart';
import 'package:open_trip/utils/responsive_util.dart';

class CartViewPayment extends StatefulWidget {
  const CartViewPayment({super.key, required this.listTrip});
  final List<TripModel> listTrip;

  @override
  State<StatefulWidget> createState() {
    return _CartViewPaymentState();
  }
}

class _CartViewPaymentState extends State<CartViewPayment> {
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
          backgroundColor: Color(0XFFF2F4F7),
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Transaksi",
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                TransactionDetail(listTrip: widget.listTrip),
                SizedBox(height: 3.w),
                TransactionMethod(listTrip: widget.listTrip),
              ],
            ),
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
                              fontSize: 12.sp, fontWeight: FontWeight.w600)),
                      Text(formatCurrency(getTotalPrice(widget.listTrip)),
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold))
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      for (final item in widget.listTrip) {
                        context.read<CartCubit>().removeFromCart(item.id);
                      }
                      context.go(RootRouteName.successScreen);
                    },
                    child: Text("Bayar Sekarang"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
