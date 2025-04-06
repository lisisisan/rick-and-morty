import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/features/main/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty/features/main/domain/usecases/get_characters.dart';
import 'package:rick_and_morty/features/main/presentation/bloc/character_bloc.dart';
import 'app.dart';
import 'core/navigation/navigation_cubit.dart';

void main() {
  final repository = CharacterRepositoryImpl(http.Client());
  final usecase = GetCharacters(repository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavigationCubit()),
        BlocProvider(
          create: (_) => CharacterBloc(usecase)..add(LoadCharacters()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
