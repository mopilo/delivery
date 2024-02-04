import 'package:delivery/shared/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackSection extends StatelessWidget {
  final Function onPress;
  const TrackSection({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 109.h,
      color: context.themeData.scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              width: 106.w,
              height: 36.h,
              child: const Text("Gotten your E-Bike yet?")),
          ElevatedButton(
            onPressed: () {
              onPress();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(183, 56),
            ),
            child: Row(
              children: [
                const Text("Your Orders", style: TextStyle(color: Colors.white),),
                SizedBox(width: 21.w),
                SvgPicture.asset("assets/forward_arrow.svg"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
