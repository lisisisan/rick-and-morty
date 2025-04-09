part of 'favorite_character_bloc.dart';

abstract class FavoriteCharacterState extends Equatable {
  @override
  List<Object> get props => [];
}

class FavoriteCharacterInitial extends FavoriteCharacterState {}

class FavoriteCharacterLoading extends FavoriteCharacterState {}

class FavoriteCharacterLoaded extends FavoriteCharacterState {
  final List<FavoriteCharacter> favorites;
  final List<FavoriteCharacter> filteredFavorites;
  final String selectedStatus;

  FavoriteCharacterLoaded(
    this.favorites, {
    List<FavoriteCharacter>? filtered,
    this.selectedStatus = 'All',
  }) : filteredFavorites = filtered ?? favorites;

  @override
  List<Object> get props => [favorites, filteredFavorites, selectedStatus];
}

class FavoriteCharacterError extends FavoriteCharacterState {
  final String message;

  FavoriteCharacterError(this.message);

  @override
  List<Object> get props => [message];
}
