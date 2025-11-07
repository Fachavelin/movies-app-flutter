import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Use select to watch only the isEmpty boolean so widgets depending on initialLoadingProvider rebuild only when emptiness changes,
// not on every list mutation.
final initialLoadingProvider = Provider<bool>((ref) =>
  ref.watch(nowPlayingMoviesProvider.select((list) => list.isEmpty)) ||
  ref.watch(popularPlayingMoviesProvider.select((list) => list.isEmpty)) ||
  ref.watch(topRatedPlayingMoviesProvider.select((list) => list.isEmpty)) ||
  ref.watch(upcomingPlayingMoviesProvider.select((list) => list.isEmpty))
);
