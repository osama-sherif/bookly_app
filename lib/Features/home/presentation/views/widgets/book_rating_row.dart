import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 13,
        ),
        const SizedBox(width: 7.1),
        const Text(style: Styles.textStyle16, '4.8'),
        const SizedBox(width: 7),
        Text(
          style: Styles.textStyle14.copyWith(color: const Color(0xff707070)),
          '(2390)',
        ),
      ],
    );
  }
}
