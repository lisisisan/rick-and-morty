import 'package:rick_and_morty/features/main/data/models/character_model.dart';

class CharacterResponse {
  final List<CharacterModel> characters;
  final String? nextPageUrl;

  CharacterResponse({required this.characters, required this.nextPageUrl});

  factory CharacterResponse.fromJson(Map<String, dynamic> json) {
    return CharacterResponse(
      characters:
          (json['results'] as List)
              .map((e) => CharacterModel.fromJson(e))
              .toList(),
      nextPageUrl: json['info']['next'],
    );
  }
}
