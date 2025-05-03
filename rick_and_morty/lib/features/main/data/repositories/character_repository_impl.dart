import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/character.dart';
import '../../domain/repositories/character_repository.dart';
import '../models/character_model.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final http.Client client;

  CharacterRepositoryImpl(this.client);

  @override
  Future<(List<Character>, String?)> getCharacters({String? pageUrl}) async {
    final uri = Uri.parse(
      pageUrl ?? 'https://rickandmortyapi.com/api/character',
    );
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final characters =
          (data['results'] as List)
              .map((e) => CharacterModel.fromJson(e) as Character)
              .toList();
      final nextPageUrl = data['info']['next'] as String?;
      return (characters, nextPageUrl);
    } else {
      throw Exception('Error fetching characters: ${response.statusCode}');
    }
  }
}
