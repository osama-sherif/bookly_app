import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating_row.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 70 / 105,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Image.asset(AssetsData.testImage),
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(
                    'Harry Potter and the Goblet of Fire',

                    style: Styles.textStyle20,
                  ),
                ),
                SizedBox(height: 3),
                Text(style: Styles.textStyle14, 'J.K. Rowling'),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text(style: Styles.textStyle15, '19.99 €'),
                    SizedBox(width: 40.3),
                    BookRating(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
