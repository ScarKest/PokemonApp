import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon_app/src/domain/entities/pokemon.dart';
import 'package:pokemon_app/src/domain/usescases/get_pokemons.dart';
import 'package:pokemon_app/src/presentation/bloc/pokemon/pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final GetPokemons getPokemon;

  PokemonCubit(this.getPokemon) : super(PokemonStateInitial());

  void getPokemons(int pages) async {
    emit(PokemonStateLoading());
    final failureOrPokemon = await getPokemon(pages);
    emit(_failureOrPokemon(failureOrPokemon));
  }

  PokemonState _failureOrPokemon(Either<Fail, Pokemon> failureOrPokemon) {
    return failureOrPokemon.fold(
        (failure) => PokemonStateError("Error en la peticion"),
        (pokemon) => PokemonStateLoaded(pokemon));
  }
}
