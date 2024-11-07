// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MovieEntity extends _MovieEntity
    with RealmEntity, RealmObjectBase, RealmObject {
  MovieEntity(
    int id,
    String title,
    double voteAverage, {
    String? posterPath,
    String? overview,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'posterPath', posterPath);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'voteAverage', voteAverage);
    RealmObjectBase.set(this, 'overview', overview);
  }

  MovieEntity._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get posterPath =>
      RealmObjectBase.get<String>(this, 'posterPath') as String?;
  @override
  set posterPath(String? value) =>
      RealmObjectBase.set(this, 'posterPath', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  double get voteAverage =>
      RealmObjectBase.get<double>(this, 'voteAverage') as double;
  @override
  set voteAverage(double value) =>
      RealmObjectBase.set(this, 'voteAverage', value);

  @override
  String? get overview =>
      RealmObjectBase.get<String>(this, 'overview') as String?;
  @override
  set overview(String? value) => RealmObjectBase.set(this, 'overview', value);

  @override
  Stream<RealmObjectChanges<MovieEntity>> get changes =>
      RealmObjectBase.getChanges<MovieEntity>(this);

  @override
  Stream<RealmObjectChanges<MovieEntity>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<MovieEntity>(this, keyPaths);

  @override
  MovieEntity freeze() => RealmObjectBase.freezeObject<MovieEntity>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'posterPath': posterPath.toEJson(),
      'title': title.toEJson(),
      'voteAverage': voteAverage.toEJson(),
      'overview': overview.toEJson(),
    };
  }

  static EJsonValue _toEJson(MovieEntity value) => value.toEJson();
  static MovieEntity _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'title': EJsonValue title,
        'voteAverage': EJsonValue voteAverage,
      } =>
        MovieEntity(
          fromEJson(id),
          fromEJson(title),
          fromEJson(voteAverage),
          posterPath: fromEJson(ejson['posterPath']),
          overview: fromEJson(ejson['overview']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(MovieEntity._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, MovieEntity, 'MovieEntity', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('posterPath', RealmPropertyType.string, optional: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('voteAverage', RealmPropertyType.double),
      SchemaProperty('overview', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
