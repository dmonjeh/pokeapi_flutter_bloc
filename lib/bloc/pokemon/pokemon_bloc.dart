import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokeapi_blocprovider_app/model/models.dart';
import 'package:http/http.dart' as http;

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(const PokemonInitialState()) {

    on<LoadPokemonEvent>((event, emit) async {
      try {
        final url = Uri.https('pokeapi.co','api/v2/pokemon/${event.index}');
        final response = await http.get(url);
        final pokemon = PokeapiPokemonResponse.fromJson(response.body);
        emit(LoadPokemonState(pokemon)); 
      } catch (e) {
        print('Error $e');
      }
    });
  }
}
