import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi_blocprovider_app/bloc/bloc_providers.dart';
import 'package:pokeapi_blocprovider_app/utils/utils.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    BlocProvider.of<HomeBloc>(context).add(LoadPokemonListEvent());
    
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
      return Container(
        color: Colors.lightBlue,
        child: SafeArea(
          top: true,
          bottom: true,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Pokedex - PokeApi'),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search_rounded),
                  onPressed: state.loading 
                  ? null
                  :() => showSearch( context: context, delegate: SearchProvider()), 
                ),
              ],
            ),
            body: state.loading 
            ?const Center(
              child: CircularProgressIndicator.adaptive(),
            )
            :ListView.builder(
              itemCount: state.pokemonList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.catching_pokemon_rounded),
                      Text('#${index+1}')
                    ],
                  ),
                  title: Text(state.pokemonList[index].name),
                  trailing: const Icon(Icons.chevron_right_sharp),
                  onTap: () {
                    final int i = index +1;
                    Navigator.pushNamed(context, 'pokemon', arguments: i);
                  },
                );
              },
            )
          ),
        ),
      );
    },
    );
  }
}