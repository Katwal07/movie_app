import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/core/enum/app_error_type.dart';
import 'package:movie_app/core/error/app_error.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_trending_movie_usecase.dart';
import 'package:movie_app/service_locator.dart';
import 'get_movies_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])
void main() {
  late GetTrendingMovieUseCase usecase;
  late MockMovieRepository mockMovieRepository;

  final tMovieList = [
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
    usecase = GetTrendingMovieUseCase();
    sl.registerLazySingleton<MovieRepository>(() => mockMovieRepository);
  });

  test('should get trending movies for repository', () async {
    /// Arrange
    when(mockMovieRepository.getTrendingMovies())
        .thenAnswer((_) async => Right(tMovieList));

    /// Act
    final result = await usecase();

    /// Assert
    expect(result, Right(tMovieList));
    verify(mockMovieRepository.getTrendingMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });

  test('should return failure when the repository fails', () async {
    // Arrange: Mock the repository response with an error
    const tError = AppError(AppErrorType.api,
        message: "Failed to fetch data from the API.");
    when(mockMovieRepository.getTrendingMovies())
        .thenAnswer((_) async => const Left(tError));

    // Act: Call the usecase
    final result = await usecase();

    // Assert: Verify error handling and interactions
    expect(result, const Left(tError));
    verify(mockMovieRepository.getTrendingMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
