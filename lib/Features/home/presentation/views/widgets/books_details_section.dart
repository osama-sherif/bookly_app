import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating_row.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .24,
          ),
          child: CustomBookDetailsViewItem(book: bookModel),
        ),
        const SizedBox(height: 24),
        Text(
          bookModel.volumeInfo.title,
          style: Styles.textStyle28,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors?[0] ?? '',
            style: Styles.textStyle14.copyWith(fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 8),
        const BookRating(
          rating: '4.8',
          count: '(2839)',
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 20),
        const BooksAction(),
      ],
    );
  }
}
