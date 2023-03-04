import 'package:flutter/material.dart';

class SkeltonShimmer extends StatelessWidget {
  double width;
  double height;

  SkeltonShimmer({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey,
          border: Border.all(color: Colors.black, width: 2)),
    );
  }
}
