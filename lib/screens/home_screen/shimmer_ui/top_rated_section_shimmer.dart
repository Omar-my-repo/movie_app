import 'package:flutter/material.dart';
import 'package:route_movies_app/shared/widgets/skelton_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedSectionShimmer extends StatelessWidget {
  const TopRatedSectionShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return const SizedBox(width: 16);
          },
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(.25),
                highlightColor: Colors.white.withOpacity(.6),
                child: SkeltonShimmer(width: 100, height: 130));
          }),
    );
  }
}
