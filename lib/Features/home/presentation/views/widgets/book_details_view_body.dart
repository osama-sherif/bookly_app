import 'package:bookly_app/Features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating_row.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SafeArea(child: BookDetailsCustomAppBar()),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .22,
            ),
            child: const CustomBookItem(),
          ),
          const SizedBox(height: 43),
          Text('The Jungle Book', style: Styles.textStyle30),
          const SizedBox(height: 6),
          Opacity(
            opacity: .7,
            child: Text(
              'Rudyard Kipling',
              style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const BookRating(),
        ],
      ),
    );
  }
}
