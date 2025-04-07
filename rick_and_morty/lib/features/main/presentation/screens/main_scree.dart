import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/character_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        if (state is CharacterLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CharacterLoaded) {
          final scrollController = ScrollController();
          scrollController.addListener(() {
            if (scrollController.position.pixels >=
                    scrollController.position.maxScrollExtent - 200 &&
                !state.isLoadingMore &&
                state.nextPageUrl != null) {
              context.read<CharacterBloc>().add(LoadMoreCharacters());
            }
          });

          return ListView.builder(
            controller: scrollController,
            itemCount: state.characters.length + (state.isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < state.characters.length) {
                final character = state.characters[index];
                return ListTile(
                  leading: Image.network(character.image),
                  title: Text(character.name),
                  subtitle: Text(character.status),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.star_border_outlined,
                      color: Colors.purple,
                    ),
                    onPressed: () {},
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
        } else if (state is CharacterError) {
          return Center(child: Text(state.message));
        }

        return const Center(child: Text('Tap the button to load characters'));
      },
    );
  }
}
