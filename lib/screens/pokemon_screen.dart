import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi_blocprovider_app/bloc/bloc_providers.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments;
    BlocProvider.of<PokemonBloc>(context).add(LoadPokemonEvent(int.parse(arg.toString())));

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Pokedex - PokeApi'),
            centerTitle: true,
          ),
          body: BlocBuilder<PokemonBloc, PokemonState>(
            builder: (context, state) {
              return state.loading 
              ?const Center(
                child: CircularProgressIndicator.adaptive(),
              )
              :Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (state.pokemon!.sprites.other!.officialArtwork.frontDefault == null)
                    ? const Text(
                      'sin imagen oficial disponible',
                      style: TextStyle(
                        fontSize: 20
                      ),
                    )
                    : SizedBox(
                      height: 200,
                      child: Image.network(state.pokemon!.sprites.other!.officialArtwork.frontDefault!)
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (state.pokemon!.sprites.frontDefault == null)
                        ? const Icon(Icons.catching_pokemon_rounded, color: Colors.grey,)
                        : Image.network(state.pokemon!.sprites.frontDefault!),
                        
                        (state.pokemon!.sprites.frontShiny == null)
                        ? const Icon(Icons.catching_pokemon_rounded, color: Colors.grey)
                        : Image.network(state.pokemon!.sprites.frontShiny!),
                      ],
                    ),

                    Text(
                      'Nombre: ${state.pokemon!.name}',
                      style: const TextStyle(
                        fontSize: 20
                      ),
                    ),
                    Text(
                      'numero pokedex: ${state.pokemon!.id}',
                      style: const TextStyle(
                        fontSize: 20
                      ),
                    ),  

                    (state.pokemon!.types.length == 1)
                    ? Text(
                        'Tipo: ${state.pokemon!.types[0].type.name}',
                        style: const TextStyle(
                          fontSize: 20
                        ),
                      )
                    : Text(
                        'Tipos: ${state.pokemon!.types[0].type.name} - ${state.pokemon!.types[1].type.name}',
                        style: const TextStyle(
                          fontSize: 20
                        ),
                      ),

                    Text(
                      'Peso: ${(state.pokemon!.weight/10)} Kg',
                      style: const TextStyle(
                        fontSize: 20
                      ),
                    ), 

                  ],
                ),
              );
            },
          )),
    );
  }
}
