import 'package:cinemapedia/config/constants/environmet.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infraestructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatasource extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3', 
      queryParameters: {
        'api_key': Environmet.movieDbApiKey,
        'language': 'en-US',
      },
    )
  );

  List<Actor> _jsonToActors(Map<String, dynamic> json) {
    final castResponse = CreditsResponse.fromJson(json);

    return castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
  }
    
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async{
    final response = await dio.get('/movie/$movieId/credits');

    return _jsonToActors(response.data);
  }

}