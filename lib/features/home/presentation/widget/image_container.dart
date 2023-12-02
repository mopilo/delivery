import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageContainer extends StatelessWidget {
  final String img;
  const ImageContainer({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265.h,
      width: 255.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          color: const Color(0xFFF1F6FB)),
      child: Image.asset(
        img,
        height: 122.h,
      ),
    );
  }
}
