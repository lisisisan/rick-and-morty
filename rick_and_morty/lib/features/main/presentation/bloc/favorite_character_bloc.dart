import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/main/data/datasorce/database.dart';
import 'package:rick_and_morty/features/main/data/enum/character_status.dart';
import 'package:rick_and_morty/features/main/data/repositories/favorite_character_repository_impl.dart';
import 'package:rick_and_morty/features/main/domain/entities/character.dart';

part 'favorite_character_state.dart';
part 'favorite_character_event.dart';

class FavoriteCharacterBloc
    extends Bloc<FavoriteCharacterEvent, FavoriteCharacterState> {
  final FavoriteCharacterRepositoryImpl repository;

  FavoriteCharacterBloc(this.repository) : super(FavoriteCharacterInitial()) {
    on<AddCharacterToFavorites>(_onAddCharacterToFavorites);
    on<RemoveCharacterFromFavorites>(_onRemoveCharacterFromFavorites);
    on<LoadFavoriteCharacters>(_onLoadFavoriteCharacters);
    on<FilterFavoriteCharactersByStatus>(_onFilterByStatus);
  }

  Future<void> _onAddCharacterToFavorites(
    AddCharacterToFavorites event,
    Emitter<FavoriteCharacterState> emit,
  ) async {
    try {
      await repository.addToFavorites(event.character);
      add(LoadFavoriteCharacters());
    } catch (e) {
      emit(FavoriteCharacterError('Error adding to favorites'));
    }
  }

  Future<void> _onRemoveCharacterFromFavorites(
    RemoveCharacterFromFavorites event,
    Emitter<FavoriteCharacterState> emit,
  ) async {
    try {
      await repository.removeFromFavorites(event.characterId);
      add(LoadFavoriteCharacters());
    } catch (e) {
      emit(FavoriteCharacterError('Error removing from favorites'));
    }
  }

  Future<void> _onLoadFavoriteCharacters(
    LoadFavoriteCharacters event,
    Emitter<FavoriteCharacterState> emit,
  ) async {
    try {
      final favorites = await repository.getFavorites();
      emit(FavoriteCharacterLoaded(favorites));
    } catch (e) {
      emit(FavoriteCharacterError('Error loading favorites'));
    }
  }

  void _onFilterByStatus(
    FilterFavoriteCharactersByStatus event,
    Emitter<FavoriteCharacterState> emit,
  ) {
    final currentState = state;
    if (currentState is FavoriteCharacterLoaded) {
      final selected = event.status;
      List<FavoriteCharacter> filtered = [];

      if (selected == CharacterStatus.all) {
        filtered = currentState.favorites;
      } else {
        filtered =
            currentState.favorites
                .where((character) => character.status == selected.apiValue)
                .toList();
      }

      emit(
        FavoriteCharacterLoaded(
          currentState.favorites,
          filtered: filtered,
          selectedStatus: selected,
        ),
      );
    }
  }
}
