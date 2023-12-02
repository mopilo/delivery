import 'package:delivery/shared/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Bikers extends StatelessWidget {
  Bikers({super.key});
  String imgGif =
      "https://s3-alpha-sig.figma.com/img/d3a0/4f2b/ea1689ada8b170b55827cd21a745f103?Expires=1702252800&Signature=qbxrVs4SSC3RUwqPRoBA9wSKw-UyU~-AH0PzgAHzJFYkGuu2MIBVuKR7d6gzT41tf2NOdQw357GB4Jx~Digu97RsztfdpSNer1XYzEsWWJfQxwx-k-7suqLPgqFTeTI-HiCkckSDGIMLDOarX4LfRFj7iTRDlYRVzCs-yT~VjfCv93jFs4ofDQaxcVHeSFUn8A538lFqbWW82zAjQUlOJ82umScUuSf~TxH4HhAynpAaZxu0Xz8JtCraA~Z-OCcOzkd0jox2yFg16~h0kabGlInbEV2mTGwRJEPA27rF5VXNBlJ01pW6Mbh09N2wgFSawZI5FtoGPSpqwi31hzCfSQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          imgGif,
          height: 161,
          width: 161,
        ),
        SizedBox(
            width: 166.w,
            height: 36.h,
            child:  Text("You too can join our Elite squad of E-bikers", style: GoogleFonts.inter(
              textStyle: context.textTheme.titleMedium!.copyWith(fontSize: 14.sp, color: const Color(0xFF424242), fontWeight: FontWeight.w400),
            ))),
      ],
    );
  }
}
