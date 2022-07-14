import 'package:dartz/dartz.dart';
import 'package:pokemon_app/src/domain/entities/pokedex.dart';
import 'package:pokemon_app/src/domain/repository/pokemon_repository.dart';

class GetPokedex {
  final PokemonRepository pokemonRepository;

  GetPokedex(this.pokemonRepository);
  Future<Either<Fail, Pokedex>> call(int pages) async =>
      pokemonRepository.getPokedex(pages);
}
