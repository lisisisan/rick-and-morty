part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final List<Character> characters;
  final String? nextPageUrl;
  final bool isLoadingMore;

  CharacterLoaded({
    required this.characters,
    required this.nextPageUrl,
    this.isLoadingMore = false,
  });

  CharacterLoaded copyWith({
    List<Character>? characters,
    String? nextPageUrl,
    bool? isLoadingMore,
  }) {
    return CharacterLoaded(
      characters: characters ?? this.characters,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [characters, nextPageUrl, isLoadingMore];
}

class CharacterError extends CharacterState {
  final String message;

  CharacterError(this.message);

  @override
  List<Object?> get props => [message];
}
