import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Strips extends StatelessWidget {
  final String strips;
  final double? heightFactor;
  final double? height;
  const Strips(
      {super.key, required this.strips, this.heightFactor, this.height});

  @override
  Widget build(BuildContext context) {
    return Align(
      heightFactor: heightFactor,
      alignment: Alignment.topRight,
      child: SvgPicture.asset(
        strips,
        height: height,
      ),
    );
  }
}
