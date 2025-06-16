import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      // Api request
      var data = await apiService.get(
        endPoints:
            'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science',
      );
      // Parsing Json data to BookModel
      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }
      return right(books);
    } catch (ex) {
      return left(ServerFailure(ex.toString()));
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
      var data = await apiService.get(
        endPoints: 'volumes?Filtering=free-ebooks&q=adventure',
      );
      // Parsing Json data to BookModel
      List<BookModel> books = [];

      for (var item in data['items']) {
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
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      // Api request
      var data = await apiService.get(
        endPoints:
            'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:programming',
      );
      // Parsing Json data to BookModel
      List<BookModel> books = [];

      for (var item in data['items']) {
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
