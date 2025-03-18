import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_trip/constants/image_constant.dart';
import 'package:open_trip/core/templates/home/input_search_home.dart';
import 'package:open_trip/core/widgets/app_logo/app_logo.dart';
import 'package:open_trip/utils/responsive_util.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key, this.child});

  final Widget? child;

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  late ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 50.h && !_isScrolled) {
        setState(() {
          _isScrolled = true;
        });
      } else if (_scrollController.offset <= 50.h && _isScrolled) {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF2F4F7),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 176.h,
            floating: false,
            pinned: true,
            backgroundColor: _isScrolled ? Colors.white : Colors.transparent,
            elevation: _isScrolled ? 4.0 : 0.0,
            centerTitle: true,
            title: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveUtil.getHorizontalPadding(),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AppLogo(
                  appLogoType:
                      _isScrolled ? AppLogoType.light : AppLogoType.dark,
                ),
              ),
            ),
            iconTheme: IconThemeData(
              color: _isScrolled ? Colors.black : Colors.white,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    ImageConstant.banner,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.4),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: ResponsiveUtil.getHorizontalPadding(),
                        right: ResponsiveUtil.getHorizontalPadding(),
                        bottom: 14.h,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Mau kemana hari ini?",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          InputSearchHome(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
