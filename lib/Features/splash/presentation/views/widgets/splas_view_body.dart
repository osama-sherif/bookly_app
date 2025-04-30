import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplasViewBody extends StatefulWidget {
  const SplasViewBody({super.key});

  @override
  State<SplasViewBody> createState() => _SplasViewBodyState();
}

class _SplasViewBodyState extends State<SplasViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController; // values from zero to one
  late Animation<Offset>
  slidingAnimation; // take the values from animation control and use it

  @override
  void initState() {
    super.initState();
    homeViewNavigation();
    initSlidingAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        SizedBox(height: 4),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 4),
      end: Offset(0, 0),
    ).animate(animationController);
    animationController.forward();
  }

  void homeViewNavigation() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(
        () => const HomeView(),
        transition: Transition.fadeIn,
        duration: kTranstionDuration,
      );
    });
  }
}
