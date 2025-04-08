part of 'favorite_character_bloc.dart';

abstract class FavoriteCharacterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddCharacterToFavorites extends FavoriteCharacterEvent {
  final Character character;

  AddCharacterToFavorites(this.character);

  @override
  List<Object> get props => [character];
}

class RemoveCharacterFromFavorites extends FavoriteCharacterEvent {
  final int characterId;

  RemoveCharacterFromFavorites(this.characterId);

  @override
  List<Object> get props => [characterId];
}

class LoadFavoriteCharacters extends FavoriteCharacterEvent {}
