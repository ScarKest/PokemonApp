import 'package:http/http.dart' as http;
import 'package:pokemon_app/src/data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonModel> getPokemon(int pages);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImpl(this.client);

  @override
  Future<PokemonModel> getPokemon(int pages) async {
    final url = Uri.parse(
        'https://pokeapi.co/api/v2/pokemon?limit=$pages&offset=$pages');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return pokemonModelFromJson(response.body);
    } else {
      throw Exception();
    }
  }
}
