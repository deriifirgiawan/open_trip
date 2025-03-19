import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_trip/core/themes/colors.dart';
import 'package:open_trip/models/TripDataModel.dart';
import 'package:open_trip/utils/responsive_util.dart';

class TransactionMethod extends StatefulWidget {
  const TransactionMethod({super.key, required this.listTrip});
  final List<TripModel> listTrip;

  @override
  State<TransactionMethod> createState() => _TransactionMethodState();
}

class _TransactionMethodState extends State<TransactionMethod> {
  final List<String> listPaymentMethod = ["Debit", "Kredit"];
  String selectedPaymentMethod = "Debit"; // Default selection

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
            "Metode Pembayaran",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.w),
          Column(
            children: listPaymentMethod.map((method) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                  ),
                ),
                child: RadioListTile<String>(
                  title: Text(method),
                  value: method,
                  groupValue: selectedPaymentMethod,
                  activeColor: ColorPalette.primary,
                  onChanged: (String? value) {
                    setState(() {
                      selectedPaymentMethod = value!;
                    });
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
