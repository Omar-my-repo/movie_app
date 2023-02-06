import 'package:flutter/material.dart';
import 'package:route_movies_app/shared/widgets/skelton_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class TopSectionShimmer extends StatelessWidget {
  const TopSectionShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 280,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(.25),
        highlightColor: Colors.white.withOpacity(.6),
        child: Stack(
          children: [
            Column(
              children: [
                SkeltonShimmer(width: double.infinity, height: 200),
                Expanded(
                    child: Row(
                  children: [
                    const SizedBox(width: 150),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SkeltonShimmer(width: 80, height: 14),
                            const SizedBox(height: 8),
                            SkeltonShimmer(width: 20, height: 10),
                            //SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
            Positioned(
              bottom: 0,
              left: 20,
              child: SkeltonShimmer(width: 130, height: 200),
            ),
          ],
        ),
      ),
    );
  }
}
