import 'package:delivery/shared/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset("assets/google.svg"),
        const Spacer(),
        Text(
          "Login with Google",
          style: GoogleFonts.inter(
            textStyle: context.textTheme.bodyMedium!.copyWith(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        ),
        const Spacer()
      ],
    );
  }
}
