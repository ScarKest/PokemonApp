import 'package:pokemon_app/src/domain/entities/pokedex.dart';

abstract class PokedexState {
  const PokedexState();
}

class PokedexStateInitial extends PokedexState {}

class PokedexStateLoaded extends PokedexState {
  final Pokedex pokedex;

  PokedexStateLoaded(this.pokedex);
}

class PokedexStateLoading extends PokedexState {}

class PokedexStateError extends PokedexState {
  final String errorMessage;

  PokedexStateError(this.errorMessage);
}

