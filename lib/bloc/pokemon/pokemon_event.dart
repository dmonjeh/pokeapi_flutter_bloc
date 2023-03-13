part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent {}

class LoadPokemonEvent extends PokemonEvent{
  final int index;

  LoadPokemonEvent(this.index);
}
