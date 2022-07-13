import 'package:flutter/material.dart';
import 'package:pokemon_app/src/domain/entities/pokemon.dart';

Widget pokemonCards(List<Result> pokemons) {
  return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      itemCount: pokemons.length,
      itemBuilder: (context, i) {
        return pokemonCard(pokemons[i], i + 1);
      });
}

Widget pokemonCard(Result pokemon, int index) {
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
        // Positioned(child: Container(child: Image.network("http://www.serebii.net/pokemongo/pokemon/index.png"),)),
        Positioned(
          top: 40,
          left: 80,
            child: Text(
          pokemon.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),
        )),
        Positioned(
            bottom: -1,
            right: 20,
            child: Text(
              "#$index",
              style: const TextStyle(
                  fontSize: 70,
                  color: Color.fromARGB(121, 230, 230, 230),
                  fontWeight: FontWeight.bold),
            ))
      ],
    ),
  );
}
