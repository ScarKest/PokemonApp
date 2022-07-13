import 'package:pokemon_app/src/data/datasources/remote_datasource.dart';
import 'package:pokemon_app/src/domain/entities/pokemon.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon_app/src/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Fail, Pokemon>> getPokemons() async {

    try {
          final pokemon = await remoteDataSource.getPokemon();
    return Right(pokemon);
    } on Exception  {
      return Left(Fail("Error en la peticion"));
    }

  }
}
