import '../entities/character.dart';
import '../repositories/character_repository.dart';

class GetCharacters {
  final CharacterRepository repository;

  GetCharacters(this.repository);

  Future<(List<Character>, String?)> call({String? pageUrl}) {
    return repository.getCharacters(pageUrl: pageUrl);
  }
}
