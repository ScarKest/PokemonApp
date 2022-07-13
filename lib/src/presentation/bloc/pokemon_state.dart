import 'package:flutter/material.dart';
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

class paginationState with ChangeNotifier {
  bool isLoadinbg = false;
  int totalPage = 0;
  int currentPage = 0;
  List<Result> results = [];
}
