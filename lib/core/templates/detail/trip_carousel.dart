import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TripCarousel extends StatefulWidget {
  final List<String> photos;

  const TripCarousel({super.key, required this.photos});

  @override
  State<TripCarousel> createState() => _TripCarouselState();
}

class _TripCarouselState extends State<TripCarousel> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Carousel Slider
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: widget.photos.length,
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            viewportFraction: 1.0,
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return CachedNetworkImage(
              imageUrl: widget.photos[index],
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder: (context, url) =>
                  Container(color: Colors.grey.shade300),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            );
          },
        ),

        Positioned(
          bottom: 16.0, // Jarak dari bawah
          child: AnimatedSmoothIndicator(
            activeIndex: _currentIndex,
            count: widget.photos.length,
            effect: ExpandingDotsEffect(
              dotHeight: 8.0,
              dotWidth: 8.0,
              activeDotColor: Colors.white,
              dotColor: Colors.white.withOpacity(0.5),
            ),
            onDotClicked: (index) {
              _carouselController.animateToPage(index);
            },
          ),
        ),
      ],
    );
  }
}
