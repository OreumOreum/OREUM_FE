import 'package:flutter/material.dart';

class CarouselItem {
  final Widget background;
  final String title;
  final String count;
  final String city;
  final bool isVisited;

  CarouselItem({
    required this.background,
    required this.title,
    required this.count,
    required this.city,
    required this.isVisited,
  });
}