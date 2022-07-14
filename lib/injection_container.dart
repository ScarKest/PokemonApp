import 'package:get_it/get_it.dart';
import 'package:pokemon_app/src/data/datasources/remote_datasource.dart';
import 'package:pokemon_app/src/data/repository/pokemon_repository_impl.dart';
import 'package:pokemon_app/src/domain/repository/pokemon_repository.dart';
import 'package:pokemon_app/src/domain/usescases/get_pokedex.dart';
import 'package:pokemon_app/src/domain/usescases/get_pokemons.dart';
import 'package:pokemon_app/src/presentation/bloc/pokedex/pokedex_cubit.dart';
import 'package:pokemon_app/src/presentation/bloc/pokemon/pokemon_cubit.dart';
 import 'package:http/http.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => PokemonCubit(sl()));
  sl.registerFactory(() => PokedexCubit(sl()));

  sl.registerLazySingleton(() => GetPokemons(sl()));
  sl.registerLazySingleton(() => GetPokedex(sl()));

  sl.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImpl(sl()));

  sl.registerLazySingleton<PokemonRemoteDataSource>(
      () => PokemonRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton(() => Client());
}
