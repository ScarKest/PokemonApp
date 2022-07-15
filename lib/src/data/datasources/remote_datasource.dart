import 'package:http/http.dart' as http;
import 'package:pokemon_app/src/data/models/pokedex_model.dart';
import 'package:pokemon_app/src/data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonModel> getPokemon(int pages);
  Future<PokedexModel> getPokedex(int pages);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImpl(this.client);

  @override
  Future<PokemonModel> getPokemon(int pages) async {
    var start = pages + 20;
    final url =
        Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=$start&offset=0');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return pokemonModelFromJson(response.body);
    } else {
      throw Exception();
    }
  }

  @override
  Future<PokedexModel> getPokedex(int pages) async {
    final url = Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGo-Pokedex/master/pokedex.json');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return pokedexModelFromJson(response.body);
    } else {
      throw Exception();
    }
  }
}
