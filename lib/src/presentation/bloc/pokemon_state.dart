import 'package:pokemon_app/src/domain/entities/pokemon.dart';

abstract class PokemonState {
  const PokemonState();
}

class PokemonStateInitial extends PokemonState {}

class PokemonStateLoaded extends PokemonState {
  final Pokemon pokemon;

  PokemonStateLoaded(this.pokemon);

}

class PokemonStateLoading extends PokemonState {}

class PokemonStateError extends PokemonState {
  final String errorMessage;

  PokemonStateError(this.errorMessage);
}
