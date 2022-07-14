import 'package:pokemon_app/src/domain/entities/pokedex.dart';
import 'package:pokemon_app/src/domain/entities/pokemon.dart';
import 'package:dartz/dartz.dart';

abstract class PokemonRepository {
  Future<Either<Fail,Pokemon>> getPokemons(int pages);
  Future<Either<Fail,Pokedex>> getPokedex(int pages);
}
