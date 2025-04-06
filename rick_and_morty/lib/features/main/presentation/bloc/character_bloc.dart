import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/character.dart';
import '../../domain/usecases/get_characters.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacters getCharacters;

  CharacterBloc(this.getCharacters) : super(CharacterInitial()) {
    on<LoadCharacters>((event, emit) async {
      emit(CharacterLoading());
      try {
        final characters = await getCharacters();
        emit(CharacterLoaded(characters));
      } catch (e) {
        emit(CharacterError(e.toString()));
      }
    });
  }
}
