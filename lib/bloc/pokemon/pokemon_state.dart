part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {
  final PokeapiPokemonResponse? pokemon;
  final bool loading;

  const PokemonState({
    required this.pokemon,
    required this.loading,
  });
}

class PokemonInitialState extends PokemonState {
  const PokemonInitialState() : super(pokemon: null, loading: true);
}

class LoadPokemonState extends PokemonState{
  final PokeapiPokemonResponse loadPokemon;

  const LoadPokemonState(this.loadPokemon) : super(pokemon: loadPokemon, loading: false);
}
