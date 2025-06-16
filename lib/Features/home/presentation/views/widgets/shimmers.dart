import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class NewestBooksShimmerAnimation extends StatelessWidget {
  const NewestBooksShimmerAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      colorOpacity: .5,
      duration: const Duration(milliseconds: 950),
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              height: 125,
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 70 / 105,
                    child: Container(color: Colors.grey.shade400),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .5,
                          height: 10,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 3),

                        Container(
                          width: MediaQuery.of(context).size.width * .5,
                          height: 10,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 3),
                        Container(
                          width: MediaQuery.of(context).size.width * .5,
                          height: 10,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            Container(
                              width: 40.3,
                              height: 8,
                              color: Colors.grey.shade400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FeaturedBooksShimmer extends StatelessWidget {
  const FeaturedBooksShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(milliseconds: 950),
      colorOpacity: .5,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 150 / 224,
                  child: Container(color: Colors.grey.shade400),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
