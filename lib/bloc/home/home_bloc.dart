import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:pokeapi_blocprovider_app/model/models.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {

    on<LoadPokemonListEvent>((event, emit) async {
      
      final url = Uri.https('pokeapi.co','api/v2/pokemon', {'offset':'0', 'limit':'1010'});
      final response = await http.get(url);

      final pokemonResponse = PokeapiResponse.fromJson(response.body);
      final List<Result> pokemon = pokemonResponse.results;

      return emit(HomeLoadPokemonState(pokemon));
    });
  }
}
