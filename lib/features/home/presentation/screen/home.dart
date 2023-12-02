import 'package:carousel_slider/carousel_slider.dart';
import 'package:delivery/features/home/presentation/widget/bikers.dart';
import 'package:delivery/features/home/presentation/widget/greetings.dart';
import 'package:delivery/features/home/presentation/widget/image_container.dart';
import 'package:delivery/features/home/presentation/widget/track_container.dart';
import 'package:delivery/features/home/presentation/widget/track_section.dart';
import 'package:delivery/features/track/presentation/screen/track.dart';
import 'package:delivery/shared/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String reason = '';
  final int _current = 0;

  final CarouselController _controller = CarouselController();

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      reason = changeReason.toString();
    });
  }

  bool setTrack = false;

  List<String> imageList = ["assets/bike_img.png", "assets/bike_img.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileHeader(),
            const Greetings(),
            !setTrack
                ? Column(
                    key: const Key("1"),
                    children: [
                      SizedBox(height: 40.h),
                      CarouselSlider(
                        items: imageList
                            .map((item) => ImageContainer(img: item))
                            .toList(),
                        options: CarouselOptions(
                          enlargeCenterPage: false,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.73,
                          onPageChanged: onPageChange,
                          autoPlay: true,
                        ),
                        carouselController: _controller,
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imageList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 6.0,
                              height: 6.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black)
                                      .withOpacity(
                                          _current == entry.key ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 25.h),
                      TrackSection(
                        onPress: () {
                          setState(() {
                            setTrack = !setTrack;
                          });
                        },
                      ),
                      Bikers()
                    ],
                  )
                : TrackContainer(
                    key: const Key("2"),
                    onPress: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const MapScreen()))
                          .whenComplete(() {
                        setState(() {
                          setTrack = !setTrack;
                        });
                      });
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
