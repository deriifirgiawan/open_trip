import 'package:flutter/material.dart';
import 'package:open_trip/core/templates/detail/detail_content.dart';
import 'package:open_trip/core/templates/detail/detail_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_trip/core/templates/detail/detail_information.dart';
import 'package:open_trip/core/templates/home/list_favorite_place.dart';
import 'package:open_trip/models/TripDataModel.dart';

class DetailLayout extends StatelessWidget {
  const DetailLayout({super.key, required this.data});

  final TripModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        DetailHeader(
          tripModel: data,
        ),
        SizedBox(
          height: 3.w,
        ),
        DetailContent(tripModel: data),
        SizedBox(
          height: 3.w,
        ),
        DetailInformation(tripModel: data),
        SizedBox(
          height: 8.w,
        ),
        ListFavoritePlace(title: "Tempat Serupa")
      ],
    );
  }
}
