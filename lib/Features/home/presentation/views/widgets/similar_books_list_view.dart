import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 6.0),
            child: CustomBookItem(
              imageUrl:
                  'https://www.freepik.com/free-vector/hand-drawn-flat-design-stack-books-illustration_24307396.htm#fromView=keyword&page=1&position=0&uuid=c70f4611-157f-452c-864a-5602d9bc9fc0&query=Book+Illustration',
            ),
          );
        },
      ),
    );
  }
}
