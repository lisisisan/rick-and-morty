import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/datasorce/database.dart';
import 'package:rick_and_morty/features/main/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty/features/main/presentation/bloc/favorite_character_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<FavoriteCharacterBloc, FavoriteCharacterState>(
          listener: (context, state) {
            if (state is FavoriteCharacterError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
        ),
      ],
      child: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, characterState) {
          if (characterState is CharacterLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (characterState is CharacterLoaded) {
            final scrollController = ScrollController();
            scrollController.addListener(() {
              if (scrollController.position.pixels >=
                      scrollController.position.maxScrollExtent - 200 &&
                  !characterState.isLoadingMore &&
                  characterState.nextPageUrl != null) {
                context.read<CharacterBloc>().add(LoadMoreCharacters());
              }
            });

            return BlocBuilder<FavoriteCharacterBloc, FavoriteCharacterState>(
              builder: (context, favoriteState) {
                final favorites =
                    favoriteState is FavoriteCharacterLoaded
                        ? favoriteState.favorites
                        : <FavoriteCharacter>[];

                return ListView.builder(
                  controller: scrollController,
                  itemCount:
                      characterState.characters.length +
                      (characterState.isLoadingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < characterState.characters.length) {
                      final character = characterState.characters[index];

                      final isFavorite = favorites.any(
                        (fav) => fav.id == character.id,
                      );

                      return ListTile(
                        leading: Image.network(character.image),
                        title: Text(character.name),
                        subtitle: Text(character.status),
                        trailing: IconButton(
                          icon: Icon(
                            isFavorite
                                ? Icons.star
                                : Icons.star_border_outlined,
                            color: Colors.purple,
                          ),
                          onPressed: () {
                            if (isFavorite) {
                              context.read<FavoriteCharacterBloc>().add(
                                RemoveCharacterFromFavorites(character.id),
                              );
                            } else {
                              context.read<FavoriteCharacterBloc>().add(
                                AddCharacterToFavorites(character),
                              );
                            }
                          },
                        ),
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                );
              },
            );
          } else if (characterState is CharacterError) {
            return Center(child: Text(characterState.message));
          }

          return const Center(child: Text('Tap the button to load characters'));
        },
      ),
    );
  }
}
