import 'package:flutter/material.dart';
import 'package:open_trip/core/themes/colors.dart';
import 'package:open_trip/utils/responsive_util.dart';

class InputSearchHome extends StatelessWidget {
  const InputSearchHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 64.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)), // Full rounded
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveUtil.getHorizontalPadding()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: ColorPalette.primary,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Cari Disini",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ColorPalette.textDisable),
                  )
                ],
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ColorPalette.primary,
                  borderRadius:
                      BorderRadius.all(Radius.circular(100)), // Full rounded
                ),
                child: Center(
                  child: Icon(
                    Icons.filter_alt,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
