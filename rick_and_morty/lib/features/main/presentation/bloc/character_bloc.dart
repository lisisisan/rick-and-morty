import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/character.dart';
import '../../domain/usecases/get_characters.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacters getCharacters;

  CharacterBloc(this.getCharacters) : super(CharacterInitial()) {
    on<LoadCharacters>(_onLoadCharacters);
    on<LoadMoreCharacters>(_onLoadMoreCharacters);
  }

  Future<void> _onLoadCharacters(
    LoadCharacters event,
    Emitter<CharacterState> emit,
  ) async {
    emit(CharacterLoading());
    try {
      final (characters, nextPageUrl) = await getCharacters();
      emit(CharacterLoaded(characters: characters, nextPageUrl: nextPageUrl));
    } catch (e) {
      emit(CharacterError(e.toString()));
    }
  }

  Future<void> _onLoadMoreCharacters(
    LoadMoreCharacters event,
    Emitter<CharacterState> emit,
  ) async {
    final currentState = state;
    if (currentState is CharacterLoaded &&
        !currentState.isLoadingMore &&
        currentState.nextPageUrl != null) {
      emit(currentState.copyWith(isLoadingMore: true));
      try {
        final (moreCharacters, nextPageUrl) = await getCharacters(
          pageUrl: currentState.nextPageUrl,
        );
        emit(
          CharacterLoaded(
            characters: [...currentState.characters, ...moreCharacters],
            nextPageUrl: nextPageUrl,
          ),
        );
      } catch (e) {
        emit(CharacterError(e.toString()));
      }
    }
  }
}
