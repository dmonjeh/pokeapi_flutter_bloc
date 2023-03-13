import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi_blocprovider_app/model/models.dart';

import '../bloc/bloc_providers.dart';

class SearchProvider extends SearchDelegate {
  List<Result> buscador = [];

  // Cambia el label del buscador
  @override
  String get searchFieldLabel => 'Buscar pokemon';

  // contenido del lado derecho del buscador
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close_rounded),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  // contenido del lado izquierdo del buscador
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () {
        close(context, null);
      },
    ); //Text('Build Leading');
  }

  //Resultado de la busqueda
  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {

        buscador = state.pokemonList.where((element) {
          return element.name.toLowerCase().contains(query.trim().toLowerCase());
        },).toList();

        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: ListView.builder(
            itemCount: buscador.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all()
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.catching_pokemon_rounded,
                        size: 45,
                      ),
                      Text(
                        buscador[index].name,
                        style: const TextStyle(
                          fontSize: 25
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  int numeroPoke = 0;

                  for (var i = 0; i < state.pokemonList.length; i++) {
                    if(state.pokemonList[i].name == buscador[index].name){
                      numeroPoke = i+1;
                    }
                  }

                  close(context, null);
                  Navigator.pushNamed(context, 'pokemon', arguments: numeroPoke);
                },
              );
            },
          ),
        );
      },
    );
  }

  // sugerencias de busqueda
  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Icon(
          Icons.catching_pokemon_rounded,
          color: Colors.black38,
          size: 100,
        ),
      );
    }

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {

        buscador = state.pokemonList.where((element) {
          return element.name.toLowerCase().contains(query.trim().toLowerCase());
        },).toList();

        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: ListView.builder(
            itemCount: buscador.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all()
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.catching_pokemon_rounded,
                        size: 45,
                      ),
                      Text(
                        buscador[index].name,
                        style: const TextStyle(
                          fontSize: 25
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  int numeroPoke = 0;

                  for (var i = 0; i < state.pokemonList.length; i++) {
                    if(state.pokemonList[i].name == buscador[index].name){
                      numeroPoke = i+1;
                    }
                  }

                  close(context, null);
                  Navigator.pushNamed(context, 'pokemon', arguments: numeroPoke);
                },
              );
            },
          ),
        );
      },
    );
  }
}
