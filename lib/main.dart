import 'package:flutter/material.dart';
import 'package:pokeapi_blocprovider_app/bloc/bloc_providers.dart';
import 'package:pokeapi_blocprovider_app/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => PokemonBloc()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home':(context) => const HomeScreen(),
        'pokemon':(context) => const PokemonScreen()
      },
    );
  }
}