part of 'favorite_character_bloc.dart';

abstract class FavoriteCharacterState extends Equatable {
  @override
  List<Object> get props => [];
}

class FavoriteCharacterInitial extends FavoriteCharacterState {}

class FavoriteCharacterLoading extends FavoriteCharacterState {}

class FavoriteCharacterLoaded extends FavoriteCharacterState {
  final List<FavoriteCharacter> favorites;

  FavoriteCharacterLoaded(this.favorites);

  @override
  List<Object> get props => [favorites];
}

class FavoriteCharacterError extends FavoriteCharacterState {
  final String message;

  FavoriteCharacterError(this.message);

  @override
  List<Object> get props => [message];
}
