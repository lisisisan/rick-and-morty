import 'package:rick_and_morty/features/datasorce/database.dart';
import 'package:rick_and_morty/features/main/domain/repositories/favorite_character_repository.dart';

import '../../domain/entities/character.dart';

class FavoriteCharacterRepositoryImpl implements FavoriteRepository {
  final AppDatabase db;

  FavoriteCharacterRepositoryImpl(this.db);

  Future<void> addToFavorites(Character character) async {
    final favoriteCharacter = FavoriteCharacter(
      id: character.id,
      name: character.name,
      image: character.image,
    );
    await db.insertFavoriteCharacter(favoriteCharacter);
  }

  Future<List<FavoriteCharacter>> getFavorites() async {
    return await db.getFavoriteCharacters();
  }

  Future<void> removeFromFavorites(int id) async {
    await db.deleteFavoriteCharacter(id);
  }

  @override
  Future<List<FavoriteCharacter>> getAllFavorites() async {
    return await getFavorites();
  }
}
