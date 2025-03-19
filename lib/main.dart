import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_trip/bloc/cart/cart_cubit.dart';
import 'package:open_trip/views/_app.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CartCubit(),
    child: App(),
  ));
}
