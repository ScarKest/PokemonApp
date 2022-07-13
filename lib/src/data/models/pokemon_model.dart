import 'dart:convert';

import 'package:pokemon_app/src/domain/entity/pokemon.dart';

PokemonModel pokemonModelFromJson(String str) =>
    PokemonModel.fromJson(json.decode(str));
    
class PokemonModel extends Pokemon {
  PokemonModel({
    required count,
    required next,
    required previous,
    required results,
  }) : super(count: count, next: next, previous: previous, results: results);

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<ResultModel>.from(
            json["results"].map((x) => ResultModel.fromJson(x))),
      );
}

class ResultModel extends Result{
  ResultModel({
    required name,
    required url,
  }) : super(name: name, url: url);

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        name: json["name"],
        url: json["url"],
      );

}
