import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/enum/app_error_type.dart';
import 'package:movie_app/core/error/app_error.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_upcomming_movies_usecase.dart';
import 'package:movie_app/service_locator.dart';
import 'get_movies_test.mocks.dart';

void main() {
  late GetUpcommingMoviesUsecase getUpcommingMoviesUsecase;
  late MockMovieRepository mockMovieRepository;

  final uMovieList = [
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

  setUp(() {
    sl.reset();
    mockMovieRepository = MockMovieRepository();
    getUpcommingMoviesUsecase = GetUpcommingMoviesUsecase();
    sl.registerLazySingleton<MovieRepository>(() => mockMovieRepository);
  });

  test('should get upcomming movies for repository', () async {
    /// Arrange
    when(mockMovieRepository.upcommingMovies())
        .thenAnswer((_) async => Right(uMovieList));

    /// Act
    final result = await getUpcommingMoviesUsecase();

    /// Assert
    expect(result, Right(uMovieList));
    verify(mockMovieRepository.upcommingMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });

    test('should return failure when the repository fails', () async {
    // Arrange: Mock the repository response with an error
    const uError = AppError(AppErrorType.api,
        message: "Failed to fetch data from the API.");
    when(mockMovieRepository.upcommingMovies())
        .thenAnswer((_) async => const Left(uError));

    // Act: Call the usecase
    final result = await getUpcommingMoviesUsecase();

    // Assert: Verify error handling and interactions
    expect(result, const Left(uError));
    verify(mockMovieRepository.upcommingMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
