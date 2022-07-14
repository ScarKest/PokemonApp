class Pokedex {
    Pokedex({
        required this.pokemon,
    });

    final List<PokemonP> pokemon;
}

class PokemonP {
    PokemonP({
        required this.id,
        required this.nume,
        required this.name,
        required this.img,
        required this.height,
        required this.weight,
        
    });

    final int id;
    final String nume;
    final String name;
    final String img;
    final String height;
    final String weight;
 
}
