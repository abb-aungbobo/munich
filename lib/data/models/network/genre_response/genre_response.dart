import 'package:json_annotation/json_annotation.dart';
import 'package:munich/domain/models/genre.dart';

part 'genre_response.g.dart';

@JsonSerializable()
class GenreResponse {
  final String name;

  const GenreResponse({
    required this.name,
  });

  factory GenreResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);
}

extension GenreResponseToGenre on GenreResponse {
  Genre toGenre() {
    return Genre(name: name);
  }
}

extension GenreResponseListToGenreList on List<GenreResponse> {
  List<Genre> toGenres() {
    return map((response) => response.toGenre()).toList();
  }
}
