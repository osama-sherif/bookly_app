import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';

import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

// define the actions of feature put not how to do this actions
// as the actions may be done with the diffrent ways
abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  });
}
