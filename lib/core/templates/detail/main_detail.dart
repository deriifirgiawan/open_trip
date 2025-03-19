import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:open_trip/bloc/cart/cart_cubit.dart';
import 'package:open_trip/core/templates/detail/trip_carousel.dart';
import 'package:open_trip/core/themes/colors.dart';
import 'package:open_trip/core/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:open_trip/core/widgets/buttons/buttons.dart';
import 'package:open_trip/core/widgets/chip_badge/chip_badge.dart';
import 'package:open_trip/core/widgets/text_input/text_input.dart';
import 'package:open_trip/models/TripDataModel.dart';
import 'package:open_trip/routes/route_name.dart';
import 'package:open_trip/utils/get_date.dart';
import 'package:open_trip/utils/responsive_util.dart';

class MainDetail extends StatefulWidget {
  const MainDetail(
      {super.key, this.child, required this.photos, required this.trip});

  final Widget? child;
  final List<String> photos;
  final TripModel trip;

  @override
  State<MainDetail> createState() => _MainDetailState();
}

class _MainDetailState extends State<MainDetail> {
  late ScrollController _scrollController;
  bool _isScrolled = false;
  List<String> _listDates = [];
  int _selectedDate = 0;

  @override
  void initState() {
    super.initState();
    getListDate();
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

  void getListDate() async {
    List<String> dates = await getNext7DaysFormatted();
    setState(() {
      _listDates = dates;
      if (_listDates.isNotEmpty) {
        _selectedDate = 0;
      }
    });
  }

  void onSelectedDate(int item) {
    setState(() {
      _selectedDate = item;
      debugPrint("Selected Date: $_selectedDate");
    });
  }

  @override
  Widget build(BuildContext context) {
    detailOrder(BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveUtil.getHorizontalPadding()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextInput(
              label: "Total Pax",
              placeholder: "Masukan Total Pax",
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 12.w,
            ),
            Text(
              "Tanggal Trip",
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 12.w,
            ),
            SizedBox(
              height: 40.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _listDates.length,
                itemBuilder: (context, index) {
                  final day = _listDates[index];
                  if (_selectedDate == index) {
                    return Padding(
                        padding: EdgeInsets.only(left: index != 0 ? 12.w : 0),
                        child: ChipBadge(
                          key: ValueKey(index),
                          text: day,
                          onPressed: () => onSelectedDate(index),
                          backgroundColor: ColorPalette.primary,
                          textColor: Colors.white,
                          borderSide:
                              BorderSide(color: ColorPalette.textDisable),
                        ));
                  }
                  return Padding(
                      padding: EdgeInsets.only(left: index != 0 ? 12.w : 0),
                      child: ChipBadge(
                        key: ValueKey(index),
                        text: day,
                        onPressed: () => onSelectedDate(index),
                        backgroundColor: _selectedDate == index
                            ? ColorPalette.primary
                            : Colors.white,
                        textColor: _selectedDate == index
                            ? Colors.white
                            : Colors.black,
                        borderSide: BorderSide(color: ColorPalette.textDisable),
                      ));
                },
              ),
            ),
            SizedBox(
              height: 40.w,
            ),
            Button(
              onPressed: () {
                context.read<CartCubit>().addToCart(widget.trip);
                context.pop();
              },
              text: "Pesan Sekarang",
            ),
            SizedBox(
              height: 12.w,
            ),
          ],
        ),
      );
    }

    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) {
            if (context.canPop()) {
              return context.pop();
            }
            return context.go(RootRouteName.homeScreen);
          }

          return context.go(RootRouteName.homeScreen);
        },
        child: Scaffold(
            backgroundColor: Color(0XFFF2F4F7),
            body: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  expandedHeight: 300.h,
                  floating: false,
                  pinned: true,
                  backgroundColor:
                      _isScrolled ? ColorPalette.primary : Colors.transparent,
                  elevation: _isScrolled ? 4.0 : 0.0,
                  centerTitle: true,
                  leading: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: ResponsiveUtil.getHorizontalPadding()),
                        child: IconButton(
                          onPressed: () => context.pop(),
                          style: IconButton.styleFrom(
                            backgroundColor:
                                Colors.white, // Warna latar belakang putih
                          ),
                          icon: Icon(
                            Icons.chevron_left,
                            color: _isScrolled
                                ? ColorPalette.textPrimary
                                : Colors
                                    .black, // Sesuaikan warna ikon agar kontras
                          ),
                        ),
                      )),
                  iconTheme: IconThemeData(
                    color: _isScrolled ? Colors.black : Colors.white,
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [TripCarousel(photos: widget.photos)],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: widget.child,
                ),
              ],
            ),
            bottomNavigationBar: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveUtil.getHorizontalPadding(),
                    vertical: 12.w),
                child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: double.infinity),
                    child: Button(
                      onPressed: () => {
                        showBottomSheets(
                            context, "Detail Pesanan", detailOrder(context))
                      },
                      text: "Pilih Trip",
                    )),
              ),
            )));
  }
}
