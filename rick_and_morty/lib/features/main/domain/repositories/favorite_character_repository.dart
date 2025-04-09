import 'package:rick_and_morty/features/main/data/datasorce/database.dart';

abstract class FavoriteRepository {
  Future<List<FavoriteCharacter>> getAllFavorites();
}
