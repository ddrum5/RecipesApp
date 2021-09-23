// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorFlutterDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder databaseBuilder(String name) =>
      _$FlutterDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FlutterDatabaseBuilder(null);
}

class _$FlutterDatabaseBuilder {
  _$FlutterDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FlutterDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FlutterDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FlutterDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FlutterDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FlutterDatabase extends FlutterDatabase {
  _$FlutterDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  RecipeDao? _recipeDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Recipe` (`id` INTEGER NOT NULL, `isVegan` INTEGER NOT NULL, `title` TEXT NOT NULL, `readyInMinutes` INTEGER NOT NULL, `imageUrl` TEXT NOT NULL, `description` TEXT NOT NULL, `likesNumber` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  RecipeDao get recipeDao {
    return _recipeDaoInstance ??= _$RecipeDao(database, changeListener);
  }
}

class _$RecipeDao extends RecipeDao {
  _$RecipeDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _recipeModelInsertionAdapter = InsertionAdapter(
            database,
            'Recipe',
            (RecipeModel item) => <String, Object?>{
                  'id': item.id,
                  'isVegan': item.isVegan ? 1 : 0,
                  'title': item.title,
                  'readyInMinutes': item.readyInMinutes,
                  'imageUrl': item.imageUrl,
                  'description': item.description,
                  'likesNumber': item.likesNumber
                },
            changeListener),
        _recipeModelUpdateAdapter = UpdateAdapter(
            database,
            'Recipe',
            ['id'],
            (RecipeModel item) => <String, Object?>{
                  'id': item.id,
                  'isVegan': item.isVegan ? 1 : 0,
                  'title': item.title,
                  'readyInMinutes': item.readyInMinutes,
                  'imageUrl': item.imageUrl,
                  'description': item.description,
                  'likesNumber': item.likesNumber
                },
            changeListener),
        _recipeModelDeletionAdapter = DeletionAdapter(
            database,
            'Recipe',
            ['id'],
            (RecipeModel item) => <String, Object?>{
                  'id': item.id,
                  'isVegan': item.isVegan ? 1 : 0,
                  'title': item.title,
                  'readyInMinutes': item.readyInMinutes,
                  'imageUrl': item.imageUrl,
                  'description': item.description,
                  'likesNumber': item.likesNumber
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RecipeModel> _recipeModelInsertionAdapter;

  final UpdateAdapter<RecipeModel> _recipeModelUpdateAdapter;

  final DeletionAdapter<RecipeModel> _recipeModelDeletionAdapter;

  @override
  Future<RecipeModel?> findRecipeById(int id) async {
    return _queryAdapter.query('SELECT * FROM Recipe WHERE id = ?1',
        mapper: (Map<String, Object?> row) => RecipeModel(
            row['id'] as int,
            (row['isVegan'] as int) != 0,
            row['title'] as String,
            row['readyInMinutes'] as int,
            row['imageUrl'] as String,
            row['description'] as String,
            row['likesNumber'] as int),
        arguments: [id]);
  }

  @override
  Future<List<RecipeModel>> getAllRecipes() async {
    return _queryAdapter.queryList('SELECT * FROM Recipe',
        mapper: (Map<String, Object?> row) => RecipeModel(
            row['id'] as int,
            (row['isVegan'] as int) != 0,
            row['title'] as String,
            row['readyInMinutes'] as int,
            row['imageUrl'] as String,
            row['description'] as String,
            row['likesNumber'] as int));
  }

  @override
  Stream<List<RecipeModel>> getAllRecipesAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Recipe',
        mapper: (Map<String, Object?> row) => RecipeModel(
            row['id'] as int,
            (row['isVegan'] as int) != 0,
            row['title'] as String,
            row['readyInMinutes'] as int,
            row['imageUrl'] as String,
            row['description'] as String,
            row['likesNumber'] as int),
        queryableName: 'Recipe',
        isView: false);
  }

  @override
  Future<void> insertRecipe(RecipeModel recipe) async {
    await _recipeModelInsertionAdapter.insert(recipe, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertRecipes(List<RecipeModel> recipes) async {
    await _recipeModelInsertionAdapter.insertList(
        recipes, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRecipe(RecipeModel recipe) async {
    await _recipeModelUpdateAdapter.update(recipe, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRecipes(List<RecipeModel> recipe) async {
    await _recipeModelUpdateAdapter.updateList(
        recipe, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteRecipe(RecipeModel recipe) async {
    await _recipeModelDeletionAdapter.delete(recipe);
  }

  @override
  Future<void> deleteRecipes(List<RecipeModel> recipes) async {
    await _recipeModelDeletionAdapter.deleteList(recipes);
  }
}
