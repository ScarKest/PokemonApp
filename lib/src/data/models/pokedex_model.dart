import 'dart:convert';

import 'package:pokemon_app/src/domain/entities/pokedex.dart';

PokedexModel pokedexModelFromJson(String str) =>
    PokedexModel.fromJson(json.decode(str));

class PokedexModel extends Pokedex {
  PokedexModel({
    required pokemon,
  }) : super(pokemon: pokemon);


  factory PokedexModel.fromJson(Map<String, dynamic> json) => PokedexModel(
        pokemon: List<PokemonP>.from(
            json["pokemon"].map((x) => PokemonPModel.fromJson(x))),
      );
}

class PokemonPModel extends PokemonP {
  PokemonPModel({
    required id,
    required nume,
    required name,
    required img,
    required height,
    required weight,
  }) : super(
            id: id,
            nume: nume,
            name: name,
            img: img,
            height: height,
            weight: weight);

  factory PokemonPModel.fromJson(Map<String, dynamic> json) => PokemonPModel(
        id: json["id"],
        nume: json["num"],
        name: json["name"],
        img: json["img"],
        height: json["height"],
        weight: json["weight"],
      );
}
