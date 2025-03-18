import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_trip/models/TripDataModel.dart';
import 'package:open_trip/routes/route_name.dart';
import 'package:open_trip/views/detail/detail_view.dart';
import 'package:open_trip/views/home/home_view.dart';

final GoRouter routes = GoRouter(routes: [
  GoRoute(
    path: RootRouteName.homeScreen,
    pageBuilder: (context, state) => CustomTransitionPage(
        child: HomeView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.9, end: 1.0).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                ),
              ),
              child: child,
            ),
          );
        }),
  ),
  GoRoute(
    path: RootRouteName.detailScreen,
    builder: (context, state) {
      final trips = state.extra as TripModel;
      return DetailView(tripModel: trips);
    },
  ),
]);
