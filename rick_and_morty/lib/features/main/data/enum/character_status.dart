enum CharacterStatus { all, alive, dead, unknown }

extension CharacterStatusExtension on CharacterStatus {
  String get label {
    switch (this) {
      case CharacterStatus.all:
        return 'All';
      case CharacterStatus.alive:
        return 'Alive';
      case CharacterStatus.dead:
        return 'Dead';
      case CharacterStatus.unknown:
        return 'Unknown';
    }
  }

  String? get apiValue {
    switch (this) {
      case CharacterStatus.all:
        return null;
      case CharacterStatus.alive:
        return 'Alive';
      case CharacterStatus.dead:
        return 'Dead';
      case CharacterStatus.unknown:
        return 'unknown';
    }
  }

  static CharacterStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return CharacterStatus.alive;
      case 'dead':
        return CharacterStatus.dead;
      case 'unknown':
        return CharacterStatus.unknown;
      default:
        return CharacterStatus.all;
    }
  }
}
