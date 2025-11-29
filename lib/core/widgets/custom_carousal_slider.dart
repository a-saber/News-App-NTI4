import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousalSlider extends StatelessWidget {
  const CustomCarousalSlider({super.key, required this.items, this.onPageChanged});

  final List<Widget> items;
  final dynamic Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items,
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 700),
        autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
        enlargeCenterPage: true,
        viewportFraction: 1,
        enlargeFactor: 0.5,
        onPageChanged: (int index, reason) {
          if(onPageChanged != null){
            onPageChanged!(index);   
          }       
        },
      ),

    );
  }
}