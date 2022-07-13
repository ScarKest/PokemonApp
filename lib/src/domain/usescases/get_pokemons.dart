import 'package:dartz/dartz.dart';
import 'package:pokemon_app/src/domain/entities/pokemon.dart';
import 'package:pokemon_app/src/domain/repository/pokemon_repository.dart';

class GetPokemons {
  final PokemonRepository pokemonRepository;

  GetPokemons(this.pokemonRepository);
  Future<Either<Fail, Pokemon>> call(int pages) async => pokemonRepository.getPokemons(pages);
}
