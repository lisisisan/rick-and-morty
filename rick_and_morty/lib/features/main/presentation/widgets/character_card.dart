import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/main/domain/entities/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final bool isFavorite;
  final GlobalKey? favoriteIconKey;
  final Function onFavoritePressed;

  const CharacterCard({
    super.key,
    required this.character,
    required this.isFavorite,
    this.favoriteIconKey,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: favoriteIconKey,
      leading: Image.network(character.image),
      title: Text(character.name),
      subtitle: Text('${character.species} • ${character.status}'),
      trailing: IconButton(
        icon: Icon(
          isFavorite ? Icons.star : Icons.star_border_outlined,
          color: Colors.purple,
        ),
        onPressed: () => onFavoritePressed(),
      ),
    );
  }
}
