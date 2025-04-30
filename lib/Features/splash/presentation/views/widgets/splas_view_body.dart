import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplasViewBody extends StatelessWidget {
  const SplasViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [Image.asset(AssetsData.logo)],
    );
  }
}
