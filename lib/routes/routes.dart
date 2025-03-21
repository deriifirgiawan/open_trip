import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_trip/models/TripDataModel.dart';
import 'package:open_trip/routes/route_name.dart';
import 'package:open_trip/views/cart/cart_view.dart';
import 'package:open_trip/views/cart/cart_view_payment.dart';
import 'package:open_trip/views/detail/detail_view.dart';
import 'package:open_trip/views/home/home_view.dart';
import 'package:open_trip/views/state/success_view.dart';

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
    path: RootRouteName.orderScreen,
    pageBuilder: (context, state) => CustomTransitionPage(
        child: CartView(),
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
  GoRoute(
    path: RootRouteName.orderPaymentScreen,
    builder: (context, state) {
      final trips = state.extra as List<TripModel>;
      return CartViewPayment(listTrip: trips);
    },
  ),
  GoRoute(
    path: RootRouteName.successScreen,
    pageBuilder: (context, state) => CustomTransitionPage(
        child: SuccessView(),
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
]);
