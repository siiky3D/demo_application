import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/src/core/config/constants/app_constants.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/theme/colors.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/features/movies/presentation/_widgets/movies/category_movie_list.dart';
import 'package:shimmer/shimmer.dart';

part '../../_widgets/movies/ranked_movie_card.dart';
part '../../_widgets/movies/shimmer_movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categoryTitle = [
    'Netflix Originals',
    'Top 10 in Nigeria Today',
    'New Releases',
    'Trending Now',
    'Action Movies',
    'Comedy Movies',
    'Horror Movies',
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          RankedMovieCard(
            size: size,
            imageUrl: AppConstants.movieImage2,
          ),
          gapH16,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return CategoryMovieList(
                categoryTitle: categoryTitle[index],
                movies: null,
                whenScrollBottom: () {},
                hasReachedMax: false,
              );
            },
          ),
        ],
      ),
    );
  }
}
