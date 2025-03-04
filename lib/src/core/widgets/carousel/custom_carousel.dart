import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider<T> extends StatelessWidget {
  const CustomCarouselSlider({
    required this.data,
    required this.itemBuilder,
    this.imageBaseUrl = '',
    super.key,
  });

  final List<T> data;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final String imageBaseUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final carouselOptions = CarouselOptions(
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      viewportFraction: 0.9,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      enlargeCenterPage: true,
    );

    return SizedBox(
      width: size.width,
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      child: CarouselSlider.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return itemBuilder(context, data[index]);
        },
        options: carouselOptions,
      ),
    );
  }
}
