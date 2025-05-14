import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  final request =
      'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:programming';
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    return await fetchNewestBooksExceptionHandling();
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }

  Future<Either<Failure, List<BookModel>>>
  fetchNewestBooksExceptionHandling() async {
    try {
      var data = await apiService.get(endPoints: request);

      List<BookModel> books = [];
      for (var item in data['item']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on DioException catch (ex) {
      return left(ServerFailure());
    }
  }
}
