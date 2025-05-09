import 'package:bookly_app/Features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating_row.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly_app/core/utils/styles.dart';

import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SafeArea(child: BookDetailsCustomAppBar()),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .24,
            ),
            child: const CustomBookItem(),
          ),
          const SizedBox(height: 24),
          const Text('The Jungle Book', style: Styles.textStyle28),
          const SizedBox(height: 4),
          Opacity(
            opacity: .7,
            child: Text(
              'Rudyard Kipling',
              style: Styles.textStyle14.copyWith(fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(height: 8),
          const BookRating(mainAxisAlignment: MainAxisAlignment.center),
          const SizedBox(height: 20),
          const BooksAction(),
          const SizedBox(height: 36),
          Align(
            alignment: Alignment.centerLeft,
            child: const Text('You can also like', style: Styles.textStyle12),
          ),
          const SizedBox(height: 17),
          const SimilarBooksListView(),
        ],
      ),
    );
  }
}
