import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/character.dart';
import '../../domain/repositories/character_repository.dart';
import '../models/character_model.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final http.Client client;

  CharacterRepositoryImpl(this.client);

  @override
  Future<List<Character>> getCharacters() async {
    final response = await client.get(
      Uri.parse('https://rickandmortyapi.com/api/character'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List)
          .map((e) => CharacterModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Ошибка загрузки персонажей');
    }
  }
}
