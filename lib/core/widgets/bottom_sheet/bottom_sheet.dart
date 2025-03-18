import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_trip/utils/responsive_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future showBottomSheets(BuildContext context, String title, Widget child) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveUtil.getHorizontalPadding()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(Icons.close))
                  ],
                ),
              ),
              child
            ],
          ),
        );
      });
}
