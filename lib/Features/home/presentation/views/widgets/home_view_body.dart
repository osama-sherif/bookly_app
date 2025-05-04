import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:bookly_app/constant.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: kPadding, child: CustomAppBar()),
              FeaturedBooksListView(),
              SizedBox(height: 52),
              Padding(
                padding: kPadding,
                child: Text('Best seller', style: Styles.textStyle18),
              ),
              SizedBox(height: 10.5),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(padding: kPadding, child: BestSellerListView()),
        ),
      ],
    );
  }
}
