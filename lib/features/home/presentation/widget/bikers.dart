import 'package:delivery/shared/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Bikers extends StatelessWidget {
  Bikers({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/bike_gif.gif",
          width: 161,
        ),
        SizedBox(
            width: 166.w,
            child:  Text("You too can join our Elite squad of E-bikers", style: GoogleFonts.inter(
              textStyle: context.textTheme.titleMedium!.copyWith(fontSize: 14.sp, color: const Color(0xFF424242), fontWeight: FontWeight.w400),
            ))),
      ],
    );
  }
}
