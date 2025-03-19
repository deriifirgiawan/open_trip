import 'package:flutter/material.dart';
import 'package:open_trip/core/templates/detail/detail_layout.dart';
import 'package:open_trip/core/templates/detail/main_detail.dart';
import 'package:open_trip/models/TripDataModel.dart';

class DetailView extends StatelessWidget {
  final TripModel tripModel;
  const DetailView({super.key, required this.tripModel});

  @override
  Widget build(BuildContext context) {
    return MainDetail(
      photos: tripModel.photos,
      trip: tripModel,
      child: DetailLayout(data: tripModel),
    );
  }
}
