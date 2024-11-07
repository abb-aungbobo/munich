import 'package:munich/data/models/database/movie_entity/movie_entity.dart';
import 'package:realm/realm.dart';

final config = Configuration.local(
  [
    MovieEntity.schema,
  ],
  schemaVersion: 1,
);
