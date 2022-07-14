import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon_app/src/domain/entities/pokedex.dart';
import 'package:pokemon_app/src/domain/usescases/get_pokedex.dart';
import 'package:pokemon_app/src/presentation/bloc/pokedex/pokedex_state.dart';

class PokedexCubit extends Cubit<PokedexState> {
  final GetPokedex getPokedex;

  PokedexCubit(this.getPokedex) : super(PokedexStateInitial());

  void getPokemonPokedex(int pages) async {
    emit(PokedexStateLoading());
    final failureOrPokemon = await getPokedex(pages);
    emit(_failureOrPokemon(failureOrPokemon));
  }

  PokedexState _failureOrPokemon(Either<Fail, Pokedex> failureOrPokemon) {
    return failureOrPokemon.fold(
        (failure) => PokedexStateError("Error en la peticion"),
        (pokedex) => PokedexStateLoaded(pokedex));
  }
}
