import 'package:delivery/features/track/presentation/screen/track.dart';
import 'package:delivery/shared/theme/app_colors.dart';
import 'package:delivery/shared/utils/context_extension.dart';
import 'package:delivery/shared/widgets/app_container.dart';
import 'package:delivery/shared/widgets/strips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackContainer extends StatelessWidget {
  final Function onPress;
  const TrackContainer({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 37),
        AppContainer(
            height: 308.h,
            conatinerMargin: const EdgeInsets.symmetric(horizontal: 20),
            decoratedBox: BoxDecoration(
                color: context.themeData.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(32.r)),
            widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Strips(
                  heightFactor: 0.4.h,
                  strips: "assets/small_strip.svg",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Track Your Package",
                    style: GoogleFonts.inter(
                      textStyle: context.textTheme.titleMedium!.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 251.w,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Enter the receipt number that has been given by the officer",
                      style: GoogleFonts.inter(
                        textStyle: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 29.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 16),
                      hintText: "Enter the receipt number",
                      hintStyle: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: AppColors.subTitleTextColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 24.w))),
                    onPressed: () {
                      onPress();
                    },
                    child: Row(
                      children: [
                        const Text("Track Now", style: TextStyle(color: Colors.white),),
                        const Spacer(),
                        SvgPicture.asset("assets/forward_arrow.svg"),
                      ],
                    ),
                  ),
                ),
              ],
            )),
        SizedBox(height: 40.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tracking history",
                style: GoogleFonts.inter(
                    textStyle: context.textTheme.titleMedium!
                        .copyWith(color: AppColors.subTitleTextColor)),
              ),
              SizedBox(height: 16.h),
              ...List.generate(2, // Number of items in the CarouselSlider
                  (index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 56.h,
                          width: 56.w,
                          padding: EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              color: Color(0xFFF1F6FB), shape: BoxShape.circle),
                          child: Image.asset(
                            "assets/bus.png",
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "SCP9374826473",
                              style: GoogleFonts.inter(
                                  textStyle: context.textTheme.bodyMedium!.copyWith(
                                      color: const Color(0xFF1E3354),
                                      letterSpacing: 0)),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "In the process",
                              style: GoogleFonts.inter(
                                  textStyle: context.textTheme.bodyMedium!.copyWith(
                                color: const Color(0xFF7A809D),
                              )),
                            )
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                        )
                      ],
                    ),
                    const SizedBox(height: 24,),
                  ],
                );
              }),
            ],
          ),
        )
      ],
    );
  }
}
