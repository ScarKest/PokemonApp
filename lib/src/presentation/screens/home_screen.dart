import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/src/domain/entities/pokemon.dart';
import 'package:pokemon_app/src/presentation/bloc/pokemon_cubit.dart';
import 'package:pokemon_app/src/presentation/bloc/pokemon_state.dart';
import 'package:pokemon_app/src/presentation/screens/error_screen.dart';
import 'package:pokemon_app/src/presentation/widgets/pokemon_card.dart';

import '../../../injection_container.dart';
import '../widgets/loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pages = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => sl<PokemonCubit>(),
          child: BlocBuilder<PokemonCubit, PokemonState>(
              builder: (context, state) {
            if (state is PokemonStateInitial) {
              const LoadingIndicator();
              getPokemons(context, pages);
            } else if (state is PokemonStateLoaded) {
              final pokemons = state.pokemon.results;
              return PokemonsCards(pokemons, pages);
            } else if (state is PokemonStateLoading) {
              return const LoadingIndicator();
            } else if (state is PokemonStateError) {
              return const ErrorScreen();
            }
            return Container();
          })),
    );
  }
}

void getPokemons(BuildContext context, int pages) async {
  final pokemonCubit = context.read<PokemonCubit>();
  pokemonCubit.getPokemons(pages);
}
