import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/injection_container.dart';
import 'package:pokemon_app/src/domain/entities/pokedex.dart';
import 'package:pokemon_app/src/domain/entities/pokemon.dart';
import 'package:pokemon_app/src/presentation/bloc/pokedex/pokedex_cubit.dart';
import 'package:pokemon_app/src/presentation/bloc/pokedex/pokedex_state.dart';
import 'package:pokemon_app/src/presentation/bloc/pokemon/pokemon_cubit.dart';
import 'package:pokemon_app/src/presentation/bloc/pokemon/pokemon_state.dart';
import 'package:pokemon_app/src/presentation/widgets/loading.dart';

// ignore: must_be_immutable
class PokemonsCards extends StatefulWidget {
  var pokemons = <Result>[];
  final int pages;
  final PokemonState state;

  PokemonsCards(this.pokemons, this.pages, this.state, {Key? key})
      : super(key: key);
  @override
  State<PokemonsCards> createState() => _PokemonsCardsState();
}

class _PokemonsCardsState extends State<PokemonsCards> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
    super.initState();
  }

  var currentPages = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        itemCount: widget.pokemons.length,
        itemBuilder: (_, i) {
          return pokedex(context, widget.pokemons[i], i);
        });
  }

  Widget pokedex(BuildContext context, Result pokemon, int index) {
    return BlocProvider(
      create: (context) => sl<PokedexCubit>(),
      child: BlocBuilder<PokedexCubit, PokedexState>(builder: (context, state) {
        if (state is PokedexStateInitial) {
          getPokemonByPokedex(context);
        } else if (state is PokedexStateLoaded) {
          var pokedex = state.pokedex;
          return pokemonCard(pokemon, pokedex.pokemon[index]);
        }
        return Container();
      }),
    );
  }

  Widget pokemonCard(Result pokemon, PokemonP image) {
    currentPages = image.id;
    var numberPokemon = (image.nume.isEmpty) ? 001 : image.nume;
    return Container(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(child: Image.asset("assets/pokebola.png")),
          Positioned(
            top: 20,
            left: 23,
              child: SizedBox(
                  height: 50,
                  child: Image.network(
                      "http://www.serebii.net/pokemongo/pokemon/$numberPokemon.png"))),
          Positioned(
              top: 40,
              left: 80,
              child: Text(
                pokemon.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              )),
          Positioned(
            bottom: -1,
            right: 20,
            child: Text(
              "#${image.nume}",
              style: const TextStyle(
                  fontSize: 70,
                  color: Color.fromARGB(121, 230, 230, 230),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void getPokemonByPokedex(BuildContext context) async {
    final pokemonCubit = context.read<PokedexCubit>();
    pokemonCubit.getPokemonPokedex(1);
  }

  Future getMorePokemons() async {
    final pokemonCubit = context.read<PokemonCubit>();
    pokemonCubit.getPokemons(currentPages + 20);
    await Future.delayed(const Duration(seconds: 6));
  }

  void _onScroll() {
    var maxScroll = scrollController.position.maxScrollExtent;
    var currentPosition = scrollController.position.pixels;
    if (currentPosition > maxScroll - 50) {
      getMorePokemons();
    }
  }
}
