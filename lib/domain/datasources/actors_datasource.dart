import 'package:cinemapedia/domain/entities/actor.dart';

abstract class ActorsDatasource {
  Future<Actor> getActorsByMovie(String movieId);

}