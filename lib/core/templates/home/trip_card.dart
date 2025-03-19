import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_trip/core/themes/colors.dart';
import 'package:open_trip/core/widgets/chip_badge/chip_badge.dart';
import 'package:open_trip/core/widgets/trip_image/trip_image.dart';
import 'package:open_trip/utils/format_currency.dart';

enum TypeCardSize { large, small }

enum TypeCard { basic, order }

class TripCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final int price;
  final double rating;
  final int reviews;
  final VoidCallback onTap;
  final TypeCardSize? typeCardSize;
  final String type;
  final TypeCard typeCard;
  final bool isSelected;

  const TripCard(
      {super.key,
      this.typeCardSize = TypeCardSize.large,
      this.typeCard = TypeCard.basic,
      this.isSelected = false,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.rating,
      required this.reviews,
      required this.onTap,
      required this.type});

  @override
  State<StatefulWidget> createState() {
    return _TripCardState();
  }
}

class _TripCardState extends State<TripCard> {
  bool _isPressed = false;

  _largeCard(BuildContext context) {
    return GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true), // Saat ditekan
        onTapUp: (_) => setState(() => _isPressed = false), // Saat dilepas
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : 1.0,
          duration: Duration(microseconds: 150),
          child: Container(
            width: 180.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.r),
              child: Stack(
                children: [
                  // Background Image
                  TripImage(
                    imageUrl: widget.imageUrl,
                    width: double.infinity,
                    height: 200.h,
                  ),

                  Positioned(
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.only(right: 12.r),
                        child: ChipBadge(
                          text: widget.type,
                          backgroundColor: widget.type == "Open Trip"
                              ? Colors.green
                              : Colors.red,
                        ),
                      )),

                  // Card Info
                  Positioned(
                    bottom: 10.h,
                    left: 10.w,
                    right: 10.w,
                    child: Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4.h),

                          // Price
                          Text(
                            formatCurrency(widget.price),
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: 8.h),

                          // Rating & Reviews
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.orange, size: 16.sp),
                              SizedBox(width: 4.w),
                              Text(
                                "${widget.rating}",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                "${widget.reviews} Reviews",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  _smallCardOrder(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
          scale: _isPressed ? 0.95 : 1.0,
          duration: Duration(microseconds: 150),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.isSelected
                  ? Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green,
                    )
                  : SizedBox(
                      width: 16.w,
                      height: 16.w,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ColorPalette.textDisable, // Warna outline
                            width: 2, // Ketebalan outline
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                width: 12.w,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: TripImage(
                  imageUrl: widget.imageUrl,
                  width: 80.w,
                  height: 80.w,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      formatCurrency(widget.price),
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorPalette.textDisable,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16.sp),
                        SizedBox(width: 4.w),
                        Text(
                          "${widget.rating}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          "${widget.reviews} Reviews",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  _smallCard(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true), // Saat ditekan
      onTapUp: (_) => setState(() => _isPressed = false), // Saat dilepas
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
          scale: _isPressed ? 0.95 : 1.0,
          duration: Duration(microseconds: 150),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: TripImage(
                  imageUrl: widget.imageUrl,
                  width: 80.w,
                  height: 80.w,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        ChipBadge(
                          text: widget.type,
                          backgroundColor: widget.type == "Open Trip"
                              ? Colors.green
                              : Colors.red,
                        ),
                      ],
                    ),
                    Text(
                      formatCurrency(widget.price),
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorPalette.textDisable,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16.sp),
                        SizedBox(width: 4.w),
                        Text(
                          "${widget.rating}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          "${widget.reviews} Reviews",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.typeCardSize == TypeCardSize.small) {
      if (widget.typeCard == TypeCard.order) {
        return _smallCardOrder(context);
      }
      return _smallCard(context);
    }

    return _largeCard(context);
  }
}
