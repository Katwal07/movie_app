import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/enum/app_error_type.dart';
import 'package:movie_app/core/error/app_error.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_similar_movies.dart';
import 'package:movie_app/service_locator.dart';

import 'get_movies_test.mocks.dart';

void main(){
  late GetSimilarMoviesUseCase getSimilarMoviesUseCase;
  late MockMovieRepository mockMovieRepository;

  int movieId = 1;

  final sMovieList = [
    MovieEntity(
      backdropPath: '/backdropPath 1',
      id: 1,
      title: 'Popular Movies 1',
      originalTitle: "Original Title 1",
      overview: "Overview 1",
      posterPath: "/posterPath1",
      mediaType: "mediaType1",
      adult: true,
      originalLanguage: "Original Language 1",
      genreIds: [1, 2, 3],
      popularity: 2.0,
      releaseDate: DateTime.parse("2022-11-02"),
      video: true,
      voteAverage: 5.0,
      voteCount: 11,
    ),
    MovieEntity(
      backdropPath: '/backdropPath 2',
      id: 2,
      title: 'Popular Movies 2',
      originalTitle: "Original Title 2",
      overview: "Overview 2",
      posterPath: "/posterPath2",
      mediaType: "mediaType2",
      adult: true,
      originalLanguage: "Original Language 2",
      genreIds: [4, 2, 3],
      popularity: 5.0,
      releaseDate: DateTime.parse("2020-11-02"),
      video: true,
      voteAverage: 6.0,
      voteCount: 19,
    ),
  ];

  setUp((){
    mockMovieRepository = MockMovieRepository();
    getSimilarMoviesUseCase = GetSimilarMoviesUseCase();
    sl.registerLazySingleton<MovieRepository>(() => mockMovieRepository);
  });

  test('should get similar movies from the repository', ()async{
    debugPrint('Movie List: $sMovieList');
    /// Arrange
    when(mockMovieRepository.similarMovies(any)).thenAnswer((_) async => Right(sMovieList));

    /// Act
    final result = await getSimilarMoviesUseCase(params: movieId);
    debugPrint("Result: $result");

    /// Assert
    expect(result, equals(Right(sMovieList)));
    verify(mockMovieRepository.similarMovies(movieId));
    verifyNoMoreInteractions(mockMovieRepository);
  });

  test('should return failure when the repository fails', () async {
    // Arrange: Mock the repository response with an error
    const tError = AppError(AppErrorType.api,
        message: "Failed to fetch data from the API.");
    when(mockMovieRepository.similarMovies(any))
        .thenAnswer((_) async => const Left(tError));

    // Act: Call the usecase
    final result = await getSimilarMoviesUseCase(params: movieId);

    // Assert: Verify error handling and interactions
    expect(result, const Left(tError));
    verify(mockMovieRepository.similarMovies(movieId));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}