import 'package:flutter/material.dart';
import 'package:open_trip/core/templates/home/list_favorite_place.dart';
import 'package:open_trip/core/templates/home/list_section_vertical.dart';
import 'package:open_trip/core/templates/home/main_home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainHome(
      child: Column(children: [
        ListFavoritePlace(
          title: "Rekomendasi Tempat",
        ),
        ListSectionVertical(
          title: "Paling Disukai",
        ),
        ListFavoritePlace(
          title: "Tempat Pilihan",
        ),
        ListSectionVertical(
          title: "Munking kamu juga suka",
        )
      ]),
    );
  }
}
