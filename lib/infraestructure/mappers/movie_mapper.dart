import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_from_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieFromMovieDB movie) => Movie(
        adult: movie.adult,
        backdropPath: movie.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
            : 'https://i.stack.imgur.com/GNhxO.png',
        genreIds: movie.genreIds.map((e) => e.toString()).toList(),
        id: movie.id,
        originalLanguage: movie.originalLanguage,
        originalTitle: movie.originalTitle,
        overview: movie.overview,
        popularity: movie.popularity,
        posterPath: movie.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
            // : 'https://i.stack.imgur.com/GNhxO.png',
            : 'no-poster',
        releaseDate: movie.releaseDate ?? DateTime(1900, 1, 1),
        title: movie.title,
        video: movie.video,
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount,
      );
}
