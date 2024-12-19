import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/enum/app_error_type.dart';
import 'package:movie_app/core/error/app_error.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/domain/movie/usecases/search_movie_usecase.dart';
import 'package:movie_app/service_locator.dart';

import 'get_movies_test.mocks.dart';

void main(){
  late SearchMovieUsecase searchMovieUsecase;
  late MockMovieRepository mockMovieRepository;

  String searchQuery = 'Test Movie 1';

  final searchMovieList = [
    MovieEntity(
      backdropPath: '/backdropPath1',
      id: 1,
      title: 'Test Movie 1',
      originalTitle: 'Original Test Movie 1',
      overview: 'Movie Testing 1',
      posterPath: '/posterPath1',
      mediaType: 'Trending 1',
      adult: true,
      originalLanguage: 'originalLanguage 1',
      genreIds: [1, 2, 3],
      popularity: 1.0,
      releaseDate: DateTime.parse('2022-02-07'),
      video: true,
      voteAverage: 2.0,
      voteCount: 11,
    ),
    MovieEntity(
      backdropPath: '/backdropPath2',
      id: 2,
      title: 'Test Movie 2',
      originalTitle: 'Original Test Movie 2',
      overview: 'Movie Testing 2',
      posterPath: '/posterPath2',
      mediaType: 'Trending 2',
      adult: false,
      originalLanguage: 'originalLanguage 2',
      genreIds: [4, 5, 6],
      popularity: 2.0,
      releaseDate: DateTime.parse('2021-07-01'),
      video: false,
      voteAverage: 3.0,
      voteCount: 17,
    ),
  ];

  setUp((){
    sl.reset();
    mockMovieRepository = MockMovieRepository();
    searchMovieUsecase = SearchMovieUsecase();
    sl.registerLazySingleton<MovieRepository>(()=> mockMovieRepository);
  });

  test('should get movies from the query from the repository', ()async{
    debugPrint('Movie List: $searchMovieList');
    /// Arrange
    when(mockMovieRepository.searchMovie(any)).thenAnswer((_) async => Right(searchMovieList));

    /// Act
    final result = await searchMovieUsecase(params: searchQuery);
    debugPrint('Result: $result'); 

    /// Assert
    expect(result, equals(Right(searchMovieList)));
    verify(mockMovieRepository.searchMovie(searchQuery));
    verifyNoMoreInteractions(mockMovieRepository);
  });

  test('should return failure when the repository fails', () async {
    // Arrange: Mock the repository response with an error
    const tError = AppError(AppErrorType.api,
        message: "Failed to fetch data from the API.");
    when(mockMovieRepository.searchMovie(any))
        .thenAnswer((_) async => const Left(tError));

    // Act: Call the usecase
    final result = await searchMovieUsecase(params: searchQuery);

    // Assert: Verify error handling and interactions
    expect(result, const Left(tError));
    verify(mockMovieRepository.searchMovie(searchQuery));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}