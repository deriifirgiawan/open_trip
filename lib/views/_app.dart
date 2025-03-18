import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_trip/core/themes/theme_data.dart';
import 'package:open_trip/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          theme: themeData,
          debugShowCheckedModeBanner: false,
          routerConfig: routes,
        );
      },
    );
  }
}
