import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/shared/full_screen_loader.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading)  return FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularPlayingMovies = ref.watch(popularPlayingMoviesProvider);
    final topRatedPlayingMovies = ref.watch(topRatedPlayingMoviesProvider);
    final upcomingPlayingMovies = ref.watch(upcomingPlayingMoviesProvider);

    final slideShowMovies = ref.watch(moviesSlideShowProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.all(0),
            title: CustomAppbar(),
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              MoviesSlideshow(movies: slideShowMovies),
              MovieHorizontalListView(
                movies: nowPlayingMovies,
                title: 'In Theatres Now',
                subTitle: 'Monday 20',
                loadNextPage: () =>
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListView(
                movies: popularPlayingMovies,
                title: 'On trend',
                subTitle: 'Monday 20',
                loadNextPage: () =>
                    ref.read(popularPlayingMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListView(
                movies: upcomingPlayingMovies,
                title: 'Top rated movies',
                subTitle: 'Monday 20',
                loadNextPage: () =>
                    ref.read(topRatedPlayingMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListView(
                movies: topRatedPlayingMovies,
                title: 'Upcoming movies',
                subTitle: 'Monday 20',
                loadNextPage: () =>
                    ref.read(upcomingPlayingMoviesProvider.notifier).loadNextPage(),
              ),
              SizedBox(
                height: 50,
              )
            ],
          );
        }))
      ],
    );
  }
}
