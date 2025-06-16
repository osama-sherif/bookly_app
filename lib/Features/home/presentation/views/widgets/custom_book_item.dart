import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/core/utils/app_router.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetilsView, extra: book);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 150 / 224,
          child: CustomBookImage(
            imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
      ),
    );
  }
}

class CustomBookDetailsViewItem extends StatelessWidget {
  const CustomBookDetailsViewItem({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 150 / 224,
        child: CustomBookImage(
          imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
        ),
      ),
    );
  }
}
