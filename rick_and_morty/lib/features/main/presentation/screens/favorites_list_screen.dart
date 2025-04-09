import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/main/data/mappers/favorite_character_mapper.dart';
import 'package:rick_and_morty/features/main/data/repositories/favorite_character_repository_impl.dart';
import 'package:rick_and_morty/features/main/presentation/bloc/favorite_character_bloc.dart';
import 'package:rick_and_morty/features/main/presentation/widgets/character_card.dart';

class FavoritesListScreen extends StatelessWidget {
  const FavoritesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => FavoriteCharacterBloc(
            context.read<FavoriteCharacterRepositoryImpl>(),
          )..add(LoadFavoriteCharacters()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Favorites')),
        body: BlocBuilder<FavoriteCharacterBloc, FavoriteCharacterState>(
          builder: (context, state) {
            if (state is FavoriteCharacterLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavoriteCharacterLoaded) {
              if (state.favorites.isEmpty) {
                return const Center(child: Text('No favorites yet'));
              }
              return ListView.builder(
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  final character = state.favorites[index];
                  return CharacterCard(
                    character: character.toCharacter(),
                    isFavorite: true,
                    onFavoritePressed: () {
                      context.read<FavoriteCharacterBloc>().add(
                        RemoveCharacterFromFavorites(character.id),
                      );
                    },
                  );
                },
              );
            } else if (state is FavoriteCharacterError) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
