import 'package:delivery/shared/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class Greetings extends StatelessWidget {
  const Greetings({super.key});


  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Text(
        "Hello Good ${greeting()}",
        style: GoogleFonts.inter(
          textStyle: context.textTheme.titleLarge!.copyWith(
            fontSize: 18.sp,
            letterSpacing: 0,
            color: const Color(0xFF092C4C),
          ),
        ),
      ),
    );
  }
}
