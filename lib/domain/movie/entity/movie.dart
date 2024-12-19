class MovieEntity {
  MovieEntity({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final String? backdropPath;
  final int? id;
  final String? title;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final bool? adult;
  final String? originalLanguage;
  final List<int> genreIds;
  final double? popularity;
  final DateTime? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  @override
  String toString() {
    return 'MovieEntity { '
        'backdropPath: $backdropPath, '
        'id: $id, '
        'title: $title, '
        'originalTitle: $originalTitle, '
        'overview: $overview, '
        'posterPath: $posterPath, '
        'mediaType: $mediaType, '
        'adult: $adult, '
        'originalLanguage: $originalLanguage, '
        'genreIds: $genreIds, '
        'popularity: $popularity, '
        'releaseDate: $releaseDate, '
        'video: $video, '
        'voteAverage: $voteAverage, '
        'voteCount: $voteCount '
        '}';
  }
}
