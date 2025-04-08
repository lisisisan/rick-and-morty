import 'package:rick_and_morty/features/datasorce/database.dart';

abstract class FavoriteRepository {
  Future<List<FavoriteCharacter>> getAllFavorites();
}
