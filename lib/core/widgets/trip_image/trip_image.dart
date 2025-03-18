import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TripImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const TripImage({
    super.key,
    required this.imageUrl,
    this.width = double.infinity,
    this.height = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          color: Colors.white,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        color: Colors.grey[300],
        child: Icon(
          Icons.broken_image,
          size: 50,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
