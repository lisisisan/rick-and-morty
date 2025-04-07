import '../entities/character.dart';

abstract class CharacterRepository {
  Future<(List<Character>, String?)> getCharacters({String? pageUrl});
}
