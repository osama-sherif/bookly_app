import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) =>
                    FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
                      ..fetchFeaturedBooks(),
          ),
          BlocProvider(
            create:
                (context) =>
                    NewestBooksCubit(getIt.get<HomeRepoImpl>())
                      ..fetchNewestBooks(),
          ),
        ],
        child: HomeViewBody(),
      ),
    );
  }
}
