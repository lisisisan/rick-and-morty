import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/features/datasorce/database.dart';
import 'package:rick_and_morty/features/main/data/repositories/character_repository_impl.dart';
import 'package:rick_and_morty/features/main/data/repositories/favorite_character_repository_impl.dart';
import 'package:rick_and_morty/features/main/domain/usecases/get_characters.dart';
import 'package:rick_and_morty/features/main/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty/features/main/presentation/bloc/favorite_character_bloc.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'core/navigation/navigation_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = await AppDatabase.openDatabase();
  final characterRepository = CharacterRepositoryImpl(http.Client());
  final favoriteRepository = FavoriteCharacterRepositoryImpl(db);
  final getCharactersUseCase = GetCharacters(characterRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavigationCubit()),
        BlocProvider(
          create:
              (_) => CharacterBloc(getCharactersUseCase)..add(LoadCharacters()),
        ),
        Provider<FavoriteCharacterRepositoryImpl>(
          create: (_) => favoriteRepository,
        ),
        BlocProvider(
          create:
              (_) =>
                  FavoriteCharacterBloc(favoriteRepository)
                    ..add(LoadFavoriteCharacters()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
