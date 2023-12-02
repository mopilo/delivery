import 'dart:async';

import 'package:delivery/features/track/presentation/providers/states/track_state.dart';
import 'package:delivery/features/track/presentation/providers/track_provider.dart';
import 'package:delivery/shared/theme/app_colors.dart';
import 'package:delivery/shared/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.0904911, 7.475338),
    zoom: 14.4746,
  );

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(trackStateNotifierProvider);

    ref.listen(
      trackStateNotifierProvider.select((value) => value),
      ((TrackState? previous, TrackState next) {
        //show Snackbar on failure
      }),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: state.maybeMap(
        loading: (_) => const Center(child: CircularProgressIndicator()),
        orElse: () => Stack(children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: MapScreen._kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          header(),
          bottomDetailsSheet()
        ]),
      ),
    );
  }

  Widget header() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 70.h),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 18,
                ),
              ),
              SizedBox(
                width: 49.w,
              ),
              Text(
                "Tracking Details",
                style: GoogleFonts.inter(
                    textStyle: context.textTheme.titleMedium!
                        .copyWith(color: const Color(0xFF092C4C))),
              ),
              const Spacer()
            ],
          ),
          SizedBox(height: 50.h),
          Container(
            height: 88.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: context.themeData.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(46.r)),
            child: Container(
              height: 56.h,
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28.r),
                  border:
                      Border.all(width: 0.5, color: const Color(0xFF051F32))),
              child: Text("SCP6653728497",
                  style: GoogleFonts.inter(
                      textStyle: context.textTheme.titleMedium!.copyWith(
                          color: const Color(0xFF051F32),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500))),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomDetailsSheet() {
    return DraggableScrollableSheet(
      initialChildSize: .2,
      minChildSize: .1,
      maxChildSize: .85,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(52.r),
                  topRight: Radius.circular(52.r))),
          child: ListView(
            controller: scrollController,
            children: [
              SizedBox(height: 30.h),
              Text("Estimate arrives in",
                  style: GoogleFonts.inter(
                      textStyle: context.textTheme.titleMedium!.copyWith(
                          color: const Color(0xFF7A809D),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400))),
              const SizedBox(height: 3),
              Text("2h 40m",
                  style: GoogleFonts.inter(
                      textStyle: context.textTheme.titleLarge!)),
              SizedBox(height: 30.h),
              Container(
                decoration: BoxDecoration(
                    color: context.themeData.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(24.r)),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    item("Sukabumi, Indonesia", "No receipt : SCP6653728497"),
                    item("2,50 USD", "Postal fee"),
                    item("Bali, Indonesia", "Parcel, 24kg", show: false),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                "History",
                style: GoogleFonts.inter(
                  textStyle: context.textTheme.titleMedium!.copyWith(
                    color: AppColors.subTitleTextColor,
                  ),
                ),
              ),
              const SizedBox(height: 24,),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 56.h,
                        width: 56.w,
                        decoration: const BoxDecoration(
                            color: Color(0xFFF1F6FB), shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          "assets/bus.svg",
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "In Delivery",
                            style: GoogleFonts.inter(
                                textStyle: context.textTheme.bodyMedium!.copyWith(
                                    color: const Color(0xFF1E3354),
                                    letterSpacing: 0)),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Bali, Indonesia",
                            style: GoogleFonts.inter(
                                textStyle: context.textTheme.bodyMedium!.copyWith(
                                  color: const Color(0xFF7A809D),
                                )),
                          )
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "00.00 PM",
                        style: GoogleFonts.inter(
                            textStyle: context.textTheme.bodyMedium!.copyWith(
                              color: const Color(0xFF7A809D), fontSize: 12.sp
                            )),
                      )
                    ],
                  ),
                  const SizedBox(height: 24,),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget item(title, subTitle, {bool show = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(textStyle: context.textTheme.titleMedium!),
        ),
        SizedBox(height: 8.h),
        Text(
          subTitle,
          style: GoogleFonts.inter(
              textStyle: context.textTheme.bodyMedium!
                  .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w300)),
        ),
        SizedBox(height: 16.h),
        if (show) const Divider()
      ],
    );
  }
}
