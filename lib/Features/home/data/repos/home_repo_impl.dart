import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  final newestBooksRequest =
      'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:programming';
  final featuredBooksRequest =
      'volumes?Filtering=free-ebooks&q=subject:programming';
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      // Api request
      var data = await apiService.get(endPoints: newestBooksRequest);
      // Parsing Json data to BookModel
      List<BookModel> books = [];
      for (var item in data['item']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromDioError(ex));
      } else {
        return left(ServerFailure(ex.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      // Api request
      var data = await apiService.get(endPoints: featuredBooksRequest);
      // Parsing Json data to BookModel
      List<BookModel> books = [];
      for (var item in data['item']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (ex) {
      if (ex is DioException) {
        return left(ServerFailure.fromDioError(ex));
      } else {
        return left(ServerFailure(ex.toString()));
      }
    }
  }
}
