import 'package:rick_and_morty/features/main/data/datasorce/database.dart';
import 'package:rick_and_morty/features/main/domain/entities/character.dart';

extension FavoriteCharacterMapper on FavoriteCharacter {
  Character toCharacter() {
    return Character(
      id: id,
      name: name,
      status: status,
      species: species,
      image: image ?? '',
    );
  }
}
