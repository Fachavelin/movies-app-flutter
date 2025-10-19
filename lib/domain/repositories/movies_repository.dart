import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDataRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
}