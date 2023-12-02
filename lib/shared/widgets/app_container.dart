import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppContainer extends StatelessWidget {
  final Widget widget;
  final double? height;
  final EdgeInsetsGeometry? conatinerMargin;
  final Decoration? decoratedBox;
  const AppContainer({super.key, required this.widget, this.height, this.conatinerMargin, this.decoratedBox});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: height,
      width: double.infinity,
      margin: conatinerMargin,
      decoration: decoratedBox,
      child: widget,
    );
  }
}
