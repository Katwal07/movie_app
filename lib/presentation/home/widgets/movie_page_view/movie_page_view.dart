import 'package:flutter/material.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';
import 'package:movie_app/presentation/home/widgets/movie_page_view/movie_card.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;
  const MoviePageView({
    super.key,
    required this.movies,
    required this.initialPage,
  });

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController? _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.8,
    );
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final MovieEntity movieEntity = widget.movies[index];
          return MovieCard(
            id: movieEntity.id ?? 0,
            posterPath: movieEntity.posterPath.toString(),
          );
        },
        pageSnapping: true,
        itemCount: widget.movies.length,
        onPageChanged: (index) {},
      ),
    );
  }
}
