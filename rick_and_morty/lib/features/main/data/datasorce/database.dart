import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DataClassName('FavoriteCharacter')
class FavoriteCharacters extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get image => text().nullable()();
  TextColumn get species => text().withLength(min: 1, max: 255)();
  TextColumn get status => text().withLength(min: 1, max: 255)();
}

@DriftDatabase(tables: [FavoriteCharacters])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  Future<int> insertFavoriteCharacter(FavoriteCharacter character) {
    return into(favoriteCharacters).insert(character);
  }

  Future<List<FavoriteCharacter>> getFavoriteCharacters() {
    return select(favoriteCharacters).get();
  }

  Future<void> deleteFavoriteCharacter(int id) {
    return (delete(favoriteCharacters)..where((t) => t.id.equals(id))).go();
  }

  static Future<AppDatabase> openDatabase() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final dbPath = join(dbFolder.path, 'app_database.db');
    return AppDatabase(NativeDatabase(File(dbPath)));
  }
}
