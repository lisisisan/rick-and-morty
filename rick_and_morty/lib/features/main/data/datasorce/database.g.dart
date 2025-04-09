// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FavoriteCharactersTable extends FavoriteCharacters
    with TableInfo<$FavoriteCharactersTable, FavoriteCharacter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteCharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _speciesMeta = const VerificationMeta(
    'species',
  );
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
    'species',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, image, species, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_characters';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteCharacter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    }
    if (data.containsKey('species')) {
      context.handle(
        _speciesMeta,
        species.isAcceptableOrUnknown(data['species']!, _speciesMeta),
      );
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteCharacter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteCharacter(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      ),
      species:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}species'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
    );
  }

  @override
  $FavoriteCharactersTable createAlias(String alias) {
    return $FavoriteCharactersTable(attachedDatabase, alias);
  }
}

class FavoriteCharacter extends DataClass
    implements Insertable<FavoriteCharacter> {
  final int id;
  final String name;
  final String? image;
  final String species;
  final String status;
  const FavoriteCharacter({
    required this.id,
    required this.name,
    this.image,
    required this.species,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    map['species'] = Variable<String>(species);
    map['status'] = Variable<String>(status);
    return map;
  }

  FavoriteCharactersCompanion toCompanion(bool nullToAbsent) {
    return FavoriteCharactersCompanion(
      id: Value(id),
      name: Value(name),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      species: Value(species),
      status: Value(status),
    );
  }

  factory FavoriteCharacter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteCharacter(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String?>(json['image']),
      species: serializer.fromJson<String>(json['species']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String?>(image),
      'species': serializer.toJson<String>(species),
      'status': serializer.toJson<String>(status),
    };
  }

  FavoriteCharacter copyWith({
    int? id,
    String? name,
    Value<String?> image = const Value.absent(),
    String? species,
    String? status,
  }) => FavoriteCharacter(
    id: id ?? this.id,
    name: name ?? this.name,
    image: image.present ? image.value : this.image,
    species: species ?? this.species,
    status: status ?? this.status,
  );
  FavoriteCharacter copyWithCompanion(FavoriteCharactersCompanion data) {
    return FavoriteCharacter(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      image: data.image.present ? data.image.value : this.image,
      species: data.species.present ? data.species.value : this.species,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteCharacter(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('species: $species, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, image, species, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteCharacter &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image &&
          other.species == this.species &&
          other.status == this.status);
}

class FavoriteCharactersCompanion extends UpdateCompanion<FavoriteCharacter> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> image;
  final Value<String> species;
  final Value<String> status;
  const FavoriteCharactersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.species = const Value.absent(),
    this.status = const Value.absent(),
  });
  FavoriteCharactersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.image = const Value.absent(),
    required String species,
    required String status,
  }) : name = Value(name),
       species = Value(species),
       status = Value(status);
  static Insertable<FavoriteCharacter> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? image,
    Expression<String>? species,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (species != null) 'species': species,
      if (status != null) 'status': status,
    });
  }

  FavoriteCharactersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? image,
    Value<String>? species,
    Value<String>? status,
  }) {
    return FavoriteCharactersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      species: species ?? this.species,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteCharactersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('species: $species, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteCharactersTable favoriteCharacters =
      $FavoriteCharactersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteCharacters];
}

typedef $$FavoriteCharactersTableCreateCompanionBuilder =
    FavoriteCharactersCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> image,
      required String species,
      required String status,
    });
typedef $$FavoriteCharactersTableUpdateCompanionBuilder =
    FavoriteCharactersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> image,
      Value<String> species,
      Value<String> status,
    });

class $$FavoriteCharactersTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteCharactersTable> {
  $$FavoriteCharactersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteCharactersTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteCharactersTable> {
  $$FavoriteCharactersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get species => $composableBuilder(
    column: $table.species,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteCharactersTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteCharactersTable> {
  $$FavoriteCharactersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$FavoriteCharactersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteCharactersTable,
          FavoriteCharacter,
          $$FavoriteCharactersTableFilterComposer,
          $$FavoriteCharactersTableOrderingComposer,
          $$FavoriteCharactersTableAnnotationComposer,
          $$FavoriteCharactersTableCreateCompanionBuilder,
          $$FavoriteCharactersTableUpdateCompanionBuilder,
          (
            FavoriteCharacter,
            BaseReferences<
              _$AppDatabase,
              $FavoriteCharactersTable,
              FavoriteCharacter
            >,
          ),
          FavoriteCharacter,
          PrefetchHooks Function()
        > {
  $$FavoriteCharactersTableTableManager(
    _$AppDatabase db,
    $FavoriteCharactersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$FavoriteCharactersTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$FavoriteCharactersTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$FavoriteCharactersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<String> species = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => FavoriteCharactersCompanion(
                id: id,
                name: name,
                image: image,
                species: species,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> image = const Value.absent(),
                required String species,
                required String status,
              }) => FavoriteCharactersCompanion.insert(
                id: id,
                name: name,
                image: image,
                species: species,
                status: status,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteCharactersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteCharactersTable,
      FavoriteCharacter,
      $$FavoriteCharactersTableFilterComposer,
      $$FavoriteCharactersTableOrderingComposer,
      $$FavoriteCharactersTableAnnotationComposer,
      $$FavoriteCharactersTableCreateCompanionBuilder,
      $$FavoriteCharactersTableUpdateCompanionBuilder,
      (
        FavoriteCharacter,
        BaseReferences<
          _$AppDatabase,
          $FavoriteCharactersTable,
          FavoriteCharacter
        >,
      ),
      FavoriteCharacter,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteCharactersTableTableManager get favoriteCharacters =>
      $$FavoriteCharactersTableTableManager(_db, _db.favoriteCharacters);
}
