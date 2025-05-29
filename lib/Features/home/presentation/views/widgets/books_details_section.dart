import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating_row.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .24,
          ),
          child: const CustomBookItem(
            imageUrl:
                'https://www.freepik.com/free-vector/hand-drawn-flat-design-stack-books-illustration_24307396.htm#fromView=keyword&page=1&position=0&uuid=c70f4611-157f-452c-864a-5602d9bc9fc0&query=Book+Illustration',
          ),
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
        const BookRating(
          rating: '20',
          count: '2-',
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 20),
        const BooksAction(),
      ],
    );
  }
}
