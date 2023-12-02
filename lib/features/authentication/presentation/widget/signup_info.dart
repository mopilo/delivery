import 'package:delivery/shared/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpInfo extends StatelessWidget {
  const SignUpInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Don’t have any account? ',
        style: GoogleFonts.inter(
            textStyle: context.textTheme.bodyMedium!
                .copyWith(height: 2.4, fontSize: 14.sp)),
        children: <TextSpan>[
          TextSpan(
            text: 'Sign Up',
            style: GoogleFonts.inter(
              textStyle: context.textTheme.titleLarge!.copyWith(
                height: 2.4,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
