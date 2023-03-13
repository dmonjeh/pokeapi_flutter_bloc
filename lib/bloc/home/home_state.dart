part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final List<Result> pokemonList;
  final bool loading;

  const HomeState({
    required this.pokemonList,
    required this.loading,
  });
}


class HomeInitialState extends HomeState {
  HomeInitialState() : super(pokemonList: [], loading: true);
}

class HomeLoadPokemonState extends HomeState {
  final List<Result> loadPokemonList;

  const HomeLoadPokemonState(this.loadPokemonList)
    : super( loading: false, pokemonList: loadPokemonList );
}
